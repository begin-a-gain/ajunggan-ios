//
//  AccountRepository.swift
//  Data
//
//  Created by 김동준 on 9/15/24
//

import Domain

public struct AccountRepository: AccountRepositoryProtocol {
    private let apiService: ApiService
    
    public init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    public func postSignIn() async -> Result<Bool, NetworkError> {
        // for test
        return .success(true)
    }
}
