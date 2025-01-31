//
//  SignUpFeature.swift
//  SignUp
//
//  Created by 김동준 on 10/4/24
//

import Base
import ComposableArchitecture

public struct SignUpFeature: Reducer {
    public init() {}
    
    public struct State: Equatable{
        public init() {}
        var isNextButtonEnable: Bool = false
        var nickname: String = ""
    }
    
    public enum Action {
        case setNickname(String)
        case nextButtonTapped
        case navigateToBack
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .setNickname(let name):
                state.nickname = name
                if !state.nickname.isEmpty {
                    state.isNextButtonEnable = true
                } else {
                    state.isNextButtonEnable = false
                }
                return .none
            case .nextButtonTapped:
                return .none
            case .navigateToBack:
                return .none
            }
        }
    }
}
