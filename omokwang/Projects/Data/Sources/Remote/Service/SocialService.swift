//
//  SocialService.swift
//  Data
//
//  Created by 김동준 on 9/19/24
//

import KakaoSDKUser

public struct SocialService {
    public init() {}
    
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
}
