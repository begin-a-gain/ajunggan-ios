//
//  SocialRepository.swift
//  Data
//
//  Created by 김동준 on 9/18/24
//

import Domain
import KakaoSDKUser

public struct SocialRepository: SocialRepositoryProtocol {
    private let apiService: ApiService
    
    public init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    @MainActor
    public func signInWithKakao() async -> Result<String, NetworkError> {
        let result = await trySignInWithKakao()
        guard let result else {
            return .failure(.badRequest)
        }
        
        return .success(result)
    }
}

extension SocialRepository {
    @MainActor
    private func trySignInWithKakao() async -> String? {
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
