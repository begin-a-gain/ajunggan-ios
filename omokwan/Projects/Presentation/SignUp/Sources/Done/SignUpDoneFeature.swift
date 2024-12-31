//
//  SignUpDoneFeature.swift
//  SignUp
//
//  Created by 김동준 on 11/20/24
//

import ComposableArchitecture

public struct SignUpDoneFeature: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init() {}
    }
    
    public enum Action {
        case navigateToMain
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .navigateToMain:
                return .none
            }
        }
    }
}
