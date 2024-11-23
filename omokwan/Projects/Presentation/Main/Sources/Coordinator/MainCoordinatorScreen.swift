//
//  MainCoordinatorScreen.swift
//  Main
//
//  Created by 김동준 on 11/20/24
//

import ComposableArchitecture

extension MainCoordinatorFeature {
    public struct MainPath: Reducer {
        public enum State: Equatable {
            case home(HomeFeature.State)
        }

        public enum Action {
            case home(HomeFeature.Action)
        }
        
        public var body: some ReducerOf<Self> {
            Scope(state: /State.home, action: /Action.home) {
                HomeFeature()._printChanges()
            }
        }
    }
}
