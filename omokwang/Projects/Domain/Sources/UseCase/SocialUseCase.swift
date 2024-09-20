//
//  SocialUseCase.swift
//  Domain
//
//  Created by 김동준 on 9/18/24
//

import DI

public protocol SocialUseCaseProtocol {
    func signInWithKakao() async -> Result<String, NetworkError>
    func signInWithApple() async -> Result<String, AppleSignInError>
}

public struct SocialUseCase: SocialUseCaseProtocol {
    let repository: SocialRepositoryProtocol
    
    public init(repository: SocialRepositoryProtocol) {
        self.repository = repository
    }

    public func signInWithKakao() async -> Result<String, NetworkError> {
        await repository.signInWithKakao()
    }
    
    public func signInWithApple() async -> Result<String, AppleSignInError> {
        await repository.signInWithApple()
    }
}
