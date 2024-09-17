//
//  SignInStore.swift
//  SignIn
//
//  Created by 김동준 on 8/25/24
//

import Foundation
import Domain
import Base

public struct SignInState {
    public init() {}
    var signInResult: String = "-"
    var count: Int = 0
}

public enum SignInAction {
    case signInButtonTapped
    case signIn
    case dataFetched
    case failed
    case allFetched
}

public class SignInStore: Reducer<SignInState, SignInAction> {
    public init(accountUseCaseProtocol: AccountUseCaseProtocol) {
        self.accountUseCaseProtocol = accountUseCaseProtocol
        super.init(initialState: SignInState())
    }
    
    private var accountUseCaseProtocol: AccountUseCaseProtocol
        
    public override func reduce(state: inout SignInState, action: SignInAction) -> Effect<SignInAction> {
        switch action {
        case .signInButtonTapped:
            print("sign in button tapped")
            state.signInResult = "..."
            return .run {
                await self.testSignIn()
            }
        case .signIn:
            return .none
        case .dataFetched:
            state.signInResult = "Success!"
            state.count += 1
            return .run {
                await self.testFunc()
            }
        case .failed:
            state.signInResult = "Failed!"
            return .none
        case .allFetched:
            state.signInResult = "All Fetched!"
            state.count += 1
            return .none
        }
    }
}

private extension SignInStore {
    private func testSignIn() async -> SignInAction {
        let _ = await accountUseCaseProtocol.signIn()
        return .dataFetched
    }
    
    private func testFunc() async -> SignInAction {
        let _ = await accountUseCaseProtocol.signIn()
        return .allFetched
    }
}
