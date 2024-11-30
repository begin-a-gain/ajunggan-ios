//
//  MainNavigation.swift
//  Main
//
//  Created by 김동준 on 12/1/24
//

import MyGame
import MyGameAdd
import ComposableArchitecture

// MARK: MyGameAddCategory Navigation
extension MainCoordinatorFeature {
    func myGameAddCategoryNavigation(_ state: inout State, _ action: MyGameAddCategoryFeature.Action) -> Effect<Action> {
        switch action {
        case .skipButtonTapped:
            state.path.append(.myGameAdd(MyGameAddFeature.State()))
            return .none
        case .nextButtonTapped:
            state.path.append(.myGameAdd(MyGameAddFeature.State()))
            return .none
        default:
            return .none
        }
    }
}

// MARK: MyGame Navigation
extension MainCoordinatorFeature {
    func myGameNavigation(_ state: inout State, _ action: MyGameFeature.Action) -> Effect<Action> {
        switch action {
        case .navigateToMyGameAddCategory:
            state.path.append(.myGameAdd(MyGameAddFeature.State()))
            return .none
        case .datePickerButtonTapped:
            return .none
        default:
            return .none
        }
    }
}
