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
        
    }
    
    public enum Action {
        
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
