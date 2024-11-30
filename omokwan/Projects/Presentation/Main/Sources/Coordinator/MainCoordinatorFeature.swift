//
//  MainCoordinatorFeature.swift
//  Main
//
//  Created by 김동준 on 10/3/24
//

import Base
import ComposableArchitecture
import MyGame
import MyGameAdd

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
            case .path(.element(id: _, action: MainCoordinatorFeature.MainPath.Action.myGame(let myGameAction))):
                return myGameNavigation(&state, myGameAction)
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: /MainCoordinatorFeature.Action.path) {
            MainPath()
        }
    }
}

// MARK: MyGame Navigation
private extension MainCoordinatorFeature {
    private func myGameNavigation(_ state: inout State, _ action: MyGameFeature.Action) -> Effect<Action> {
        switch action {
        case .navigateToMyGameAdd:
            state.path.append(.myGameAdd(MyGameAddFeature.State()))
            return .none
        case .datePickerButtonTapped:
            return .none
        default:
            return .none
        }
    }
}
