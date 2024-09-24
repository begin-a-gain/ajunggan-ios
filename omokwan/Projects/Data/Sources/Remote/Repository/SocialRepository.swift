//
//  SocialRepository.swift
//  Data
//
//  Created by 김동준 on 9/18/24
//

import Domain

public struct SocialRepository: SocialRepositoryProtocol {
    private let socialService: SocialService
    
    public init(socialService: SocialService) {
        self.socialService = socialService
    }
    
    @MainActor
    public func signInWithKakao() async -> Result<String, NetworkError> {
        let result = await socialService.signInWithKakao()
        guard let result else {
            return .failure(.badRequest)
        }
        
        return .success(result)
    }
    
    public func signInWithApple() async -> Result<String, AppleSignInError> {
        let result = await socialService.signInWithApple()
        switch result {
        case .success(let token):
            return .success(token)
        case .failure(let error):
            return .failure(error)
        }
    }
}
