//
//  MainCoordinatorFeature.swift
//  Main
//
//  Created by 김동준 on 10/3/24
//

import Base
import ComposableArchitecture
import CasePaths

public struct MainCoordinatorFeature: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init() {}

        var path: StackState<MainPath.State> = .init()
    }

    public enum Action {
        case path(StackAction<MainPath.State, MainPath.Action>)
    }

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: /MainCoordinatorFeature.Action.path) {
            MainPath()
        }
    }
}
