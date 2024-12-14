//
//  MyGameAddCategoryFeature.swift
//  MyGameAdd
//
//  Created by 김동준 on 11/30/24
//

import ComposableArchitecture
import Domain

public struct MyGameAddCategoryFeature: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init() {}
        
        var categories: [GameCategory] = GameCategory.allCases
        var selectedCategory: GameCategory?
        var isNextButtonEnable: Bool {
            return selectedCategory != nil
        }
    }
    
    public enum Action {
        case skipButtonTapped
        case nextButtonTapped(GameCategory?)
        case categoryTapped(GameCategory)
        case navigateToBack
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .skipButtonTapped:
                return .none
            case .nextButtonTapped:
                return .none
            case .categoryTapped(let category):
                state.selectedCategory = category
                return .none
            case .navigateToBack:
                return .none
            }
        }
    }
}
