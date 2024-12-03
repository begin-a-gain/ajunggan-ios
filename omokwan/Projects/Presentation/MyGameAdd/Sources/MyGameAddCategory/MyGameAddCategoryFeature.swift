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
        var isSelectedList: [Bool] = Array(repeating: false, count: GameCategory.allCases.count)
        var isNextButtonEnable: Bool {
            return !isSelectedList.filter{ $0 == true }.isEmpty
        }
    }
    
    public enum Action {
        case skipButtonTapped
        case nextButtonTapped
        case categoryTapped(Int)
        case navigateToBack
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .skipButtonTapped:
                return .none
            case .nextButtonTapped:
                return .none
            case .categoryTapped(let index):
                state.isSelectedList[index].toggle()
                return .none
            case .navigateToBack:
                return .none
            }
        }
    }
}
