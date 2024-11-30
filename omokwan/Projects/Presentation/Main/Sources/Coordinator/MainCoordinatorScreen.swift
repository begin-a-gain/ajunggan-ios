//
//  MainCoordinatorScreen.swift
//  Main
//
//  Created by 김동준 on 11/20/24
//

import ComposableArchitecture
import MyGame
import MyGameAdd

extension MainCoordinatorFeature {
    public struct MainPath: Reducer {
        public enum State: Equatable {
            case myGame(MyGameFeature.State)
            case myGameAdd(MyGameAddFeature.State)
        }

        public enum Action {
            case myGame(MyGameFeature.Action)
            case myGameAdd(MyGameAddFeature.Action)
        }
        
        public var body: some ReducerOf<Self> {
            Scope(state: /State.myGame, action: /Action.myGame) {
                MyGameFeature()
            }
            Scope(state: /State.myGameAdd, action: /Action.myGameAdd) {
                MyGameAddFeature()
            }
        }
    }
}
