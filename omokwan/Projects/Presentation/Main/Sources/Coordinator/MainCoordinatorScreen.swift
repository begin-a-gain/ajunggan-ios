//
//  MainCoordinatorScreen.swift
//  Main
//
//  Created by 김동준 on 11/20/24
//

import ComposableArchitecture
import MyGame
import MyGameAdd
import MyGameParticipate

extension MainCoordinatorFeature {
    public struct MainPath: Reducer {
        public enum State: Equatable {
            case myGame(MyGameFeature.State)
            case myGameAdd(MyGameAddFeature.State)
            case myGameAddCategory(MyGameAddCategoryFeature.State)
            case myGameParticipate(MyGameParticipateFeature.State)
        }

        public enum Action {
            case myGame(MyGameFeature.Action)
            case myGameAdd(MyGameAddFeature.Action)
            case myGameAddCategory(MyGameAddCategoryFeature.Action)
            case myGameParticipate(MyGameParticipateFeature.Action)
        }
        
        public var body: some ReducerOf<Self> {
            Scope(state: /State.myGame, action: /Action.myGame) {
                MyGameFeature()
            }
            Scope(state: /State.myGameAdd, action: /Action.myGameAdd) {
                MyGameAddFeature()
            }
            Scope(state: /State.myGameAddCategory, action: /Action.myGameAddCategory) {
                MyGameAddCategoryFeature()
            }
            Scope(state: /State.myGameParticipate, action: /Action.myGameParticipate) {
                MyGameParticipateFeature()
            }
        }
    }
}
