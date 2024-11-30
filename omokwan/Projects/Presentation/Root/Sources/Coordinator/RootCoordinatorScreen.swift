//
//  RootCoordinatorScreen.swift
//  Root
//
//  Created by 김동준 on 11/20/24
//

import ComposableArchitecture
import SignIn
import SignUp
import Main

extension RootCoordinatorFeature {
    public struct RootPath: Reducer {
        public enum State: Equatable {
            case signIn(SignInFeature.State)
            case signUp(SignUpFeature.State)
        }

        public enum Action {
            case signIn(SignInFeature.Action)
            case signUp(SignUpFeature.Action)
        }
        
        public var body: some ReducerOf<Self> {
            Scope(state: /State.signIn, action: /Action.signIn) {
                SignInFeature()
            }
            Scope(state: /State.signUp, action: /Action.signUp) {
                SignUpFeature()
            }
        }
    }
}
