//
//  SignInFeature.swift
//  SignIn
//
//  Created by 김동준 on 8/25/24
//

import Domain
import Base
import ComposableArchitecture

public struct SignInFeature: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init() {}
        
        var tempKakaoToken: String = "-"
        var tempAppleToken: String = "-"
    }
    
    public enum Action {
        case kakaoButtonTapped
        case receiveKakaoTokenSuccessfully(String)
        case kakaoLoginError(NetworkError)
        case appleButtonTapped
        case receiveAppleTokenSuccessfully(String)
        case appleLoginError(AppleSignInError)
        case navigateToSignUp
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .kakaoButtonTapped:
                // TODO: 임시, 테스트 빠르게 하기 위함. 추후 제거할 것
                return .none
//                return .run { send in
//                    await send(signInWithKakao())
//                }
            case .receiveKakaoTokenSuccessfully(let token):
                state.tempKakaoToken = token
                return .none
            case .kakaoLoginError(let error):
                state.tempKakaoToken = error.localizedDescription
                return .none
            case .appleButtonTapped:
                return .run { send in
                    await send(signInWithApple())
                }
            case .receiveAppleTokenSuccessfully(let token):
                state.tempAppleToken = token
                return .send(.navigateToSignUp)
            case .appleLoginError(let error):
                state.tempAppleToken = error.localizedDescription
                return .none
            case .navigateToSignUp:
                return .none
            }
        }
    }
}

private extension SignInFeature {
    private func signInWithKakao() async -> Action {
        return .receiveKakaoTokenSuccessfully("")
//        let response = await socialUseCaseProtocol.signInWithKakao()
//        switch response {
//        case let .success(result):
//            return .receiveKakaoTokenSuccessfully(result)
//        case let .failure(error):
//            return .kakaoLoginError(error)
//        }
    }
    
    private func signInWithApple() async -> Action {
        return .receiveAppleTokenSuccessfully("")
//        let response = await socialUseCaseProtocol.signInWithApple()
//        switch response {
//        case let .success(result):
//            return .receiveAppleTokenSuccessfully(result)
//        case let .failure(error):
//            return .appleLoginError(error)
//        }
    }
}
