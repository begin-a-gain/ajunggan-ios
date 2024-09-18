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
        registerApiService()
        registerAccountDependency()
        registerSocialDependency()
    }
    
    private func registerApiService() {
        container.register(ApiService.self) { _ in
            ApiService()
        }
    }
    
    private func registerAccountDependency() {
        container.register(AccountRepositoryProtocol.self) { resolver in
            let apiService: ApiService = resolver.resolve()
            return AccountRepository(apiService: apiService)
        }
        
        container.register(AccountUseCaseProtocol.self) { resolver in
            let repository: AccountRepositoryProtocol = resolver.resolve()
            return AccountUseCase(repository: repository)
        }
    }
    
    private func registerSocialDependency() {
        container.register(SocialRepositoryProtocol.self) { resolver in
            let apiService: ApiService = resolver.resolve()
            return SocialRepository(apiService: apiService)
        }
        
        container.register(SocialUseCaseProtocol.self) { resolver in
            let repository: SocialRepositoryProtocol = resolver.resolve()
            return SocialUseCase(repository: repository)
        }
    }
}
