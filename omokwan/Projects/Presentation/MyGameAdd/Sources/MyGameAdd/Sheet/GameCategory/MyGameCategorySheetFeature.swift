//
//  MyGameCategorySheetFeature.swift
//  MyGameAdd
//
//  Created by 김동준 on 12/7/24
//

import ComposableArchitecture
import Domain

public struct MyGameCategorySheetFeature: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init(selectedCategory: GameCategory?) {
            self.selectedCategory = selectedCategory
        }
        
        var categories: [GameCategory] = GameCategory.allCases
        var selectedCategory: GameCategory?
    }
    
    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case categoryTapped(String)
        case selectButtonTapped(GameCategory)
    }
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .categoryTapped(let category):
                guard let selectedCategory = state.selectedCategory else {
                    state.selectedCategory = state.categories.first{ $0.rawValue == category}
                    return .none
                }
                if selectedCategory.rawValue != category {
                    state.selectedCategory = state.categories.first{ $0.rawValue == category}
                } else {
                    state.selectedCategory = nil
                }
                
                return .none
            case .selectButtonTapped:
                return .none
            }
        }
    }
}
