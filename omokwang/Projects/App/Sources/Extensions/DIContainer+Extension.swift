//
//  DIContainer+Extension.swift
//  App
//
//  Created by 김동준 on 9/15/24
//

import DI
import Data
import Domain

extension DIContainer {
    func register() {
        container.register(ApiService.self) { _ in
            ApiService()
        }
        
        container.register(AccountRepositoryProtocol.self) { resolver in
            let apiService: ApiService = resolver.resolve()
            return AccountRepository(apiService: apiService)
        }
        
        container.register(AccountUseCaseProtocol.self) { resolver in
            let repository: AccountRepositoryProtocol = resolver.resolve()
            return AccountUseCase(repository: repository)
        }
    }
}
