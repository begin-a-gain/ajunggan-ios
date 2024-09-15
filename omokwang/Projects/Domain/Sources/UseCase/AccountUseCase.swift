//
//  AccountUseCase.swift
//  Domain
//
//  Created by 김동준 on 9/15/24
//

import DI

public protocol AccountUseCaseProtocol {
    func signIn() async -> Result<Bool, NetworkError>
}

public struct AccountUseCase: AccountUseCaseProtocol {
    let repository: AccountRepositoryProtocol
    
    public init(repository: AccountRepositoryProtocol) {
        self.repository = repository
    }

    public func signIn() async -> Result<Bool, NetworkError> {
        await repository.postSignIn()
    }
}
