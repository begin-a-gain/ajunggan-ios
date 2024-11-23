//
//  MainFeature.swift
//  Main
//
//  Created by 김동준 on 11/20/24
//

import Foundation
import ComposableArchitecture

public struct MainFeature: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init() {}
        
        var selectedTab: MainBottomTabItem = .myGame
        @PresentationState var addGameSheet: AddGameSheetFeature.State?
    }
    
    public enum Action {
        case selectTab(MainBottomTabItem)
        case addGameSheet(PresentationAction<AddGameSheetFeature.Action>)
        case addGameButtonTapped
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .selectTab(let item):
                state.selectedTab = item
                return .none
            case .addGameSheet:
                return .none
            case .addGameButtonTapped:
                state.addGameSheet = .init()
                return .none
            }
        }
        .ifLet(\.$addGameSheet, action: /MainFeature.Action.addGameSheet) {
            AddGameSheetFeature()
        }
    }
}
