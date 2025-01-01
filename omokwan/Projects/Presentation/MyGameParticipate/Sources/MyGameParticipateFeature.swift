//
//  MyGameParticipateFeature.swift
//  MyGameParticipate
//
//  Created by 김동준 on 1/1/25
//

import ComposableArchitecture

public struct MyGameParticipateFeature: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init() {}
    }
    
    public enum Action {
        case navigateToBack
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .navigateToBack:
                return .none
            }
        }
    }
}
