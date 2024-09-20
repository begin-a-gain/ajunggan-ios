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
    var tempKakaoToken: String = "-"
    var tempAppleToken: String = "-"
}

public enum SignInAction {
    case kakaoButtonTapped
    case receiveKakaoTokenSuccessfully(String)
    case kakaoLoginError(NetworkError)
    case appleButtonTapped
    case receiveAppleTokenSuccessfully(String)
    case appleLoginError(AppleSignInError)
}

public class SignInStore: Reducer<SignInState, SignInAction> {
    public init(
        accountUseCaseProtocol: AccountUseCaseProtocol,
        socialUseCaseProtocol: SocialUseCaseProtocol
    ) {
        self.accountUseCaseProtocol = accountUseCaseProtocol
        self.socialUseCaseProtocol = socialUseCaseProtocol
        super.init(initialState: SignInState())
    }
    
    private var accountUseCaseProtocol: AccountUseCaseProtocol
    private var socialUseCaseProtocol: SocialUseCaseProtocol
        
    public override func reduce(state: inout SignInState, action: SignInAction) -> Effect<SignInAction> {
        switch action {
        case .kakaoButtonTapped:
            return .run {
                await self.signInWithKakao()
            }
        case .receiveKakaoTokenSuccessfully(let token):
            state.tempKakaoToken = token
            return .none
        case .kakaoLoginError(let error):
            state.tempKakaoToken = error.localizedDescription
            return .none
        case .appleButtonTapped:
            return .run {
                await self.signInWithApple()
            }
        case .receiveAppleTokenSuccessfully(let token):
            state.tempAppleToken = token
            return .none
        case .appleLoginError(let error):
            state.tempAppleToken = error.localizedDescription
            return .none
        }
    }
}

private extension SignInStore {
    private func signInWithKakao() async -> SignInAction {
        let response = await socialUseCaseProtocol.signInWithKakao()
        switch response {
        case let .success(result):
            return .receiveKakaoTokenSuccessfully(result)
        case let .failure(error):
            return .kakaoLoginError(error)
        }
    }
    
    private func signInWithApple() async -> SignInAction {
        let response = await socialUseCaseProtocol.signInWithApple()
        switch response {
        case let .success(result):
            return .receiveAppleTokenSuccessfully(result)
        case let .failure(error):
            return .appleLoginError(error)
        }
    }
}
