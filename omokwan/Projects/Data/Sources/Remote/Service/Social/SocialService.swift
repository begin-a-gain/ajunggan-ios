//
//  SocialService.swift
//  Data
//
//  Created by 김동준 on 9/19/24
//

import KakaoSDKUser
import AuthenticationServices

public class SocialService: NSObject {
    public override init() {}
    private var appleSignDelegate: AppleSignDelegate? = nil

    @MainActor
    func signInWithKakao() async -> String? {
        do {
            if UserApi.isKakaoTalkLoginAvailable() {
                return try await withCheckedThrowingContinuation { continuation in
                    UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                        if let error = error {
                            continuation.resume(throwing: error)
                        } else if let oauthToken = oauthToken {
                            continuation.resume(returning: oauthToken.accessToken)
                        }
                    }
                }
            } else {
                return try await withCheckedThrowingContinuation { continuation in
                    UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                        if let error = error {
                            continuation.resume(throwing: error)
                        } else if let oauthToken = oauthToken {
                            continuation.resume(returning: oauthToken.accessToken)
                        }
                    }
                }
            }
        } catch {
            return nil
        }
    }
    
    @MainActor
    func signInWithApple() async -> AppleSignResult {
        let result = await withCheckedContinuation { continuation in
            let request = ASAuthorizationAppleIDProvider().createRequest()
            request.requestedScopes = [.fullName, .email]
            let controller = ASAuthorizationController(authorizationRequests: [request])
            
            appleSignDelegate = AppleSignDelegate(appleSignContinuation: continuation)
            controller.delegate = appleSignDelegate
            controller.performRequests()
        }
        
        appleSignDelegate = nil
        return result
    }
}
