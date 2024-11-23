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
    }
    
    public enum Action {
        case selectTab(MainBottomTabItem)

    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .selectTab(let item):
                state.selectedTab = item
                return .none
            }
        }
    }
}
