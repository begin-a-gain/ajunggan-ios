//
//  MainCoordinatorScreen.swift
//  Main
//
//  Created by 김동준 on 11/20/24
//

import ComposableArchitecture
import MyGame

extension MainCoordinatorFeature {
    public struct MainPath: Reducer {
        public enum State: Equatable {
            case myGame(MyGameFeature.State)
        }

        public enum Action {
            case myGame(MyGameFeature.Action)
        }
        
        public var body: some ReducerOf<Self> {
            Scope(state: /State.myGame, action: /Action.myGame) {
                MyGameFeature()._printChanges()
            }
        }
    }
}
