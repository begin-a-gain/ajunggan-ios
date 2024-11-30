//
//  MyGameFeature.swift
//  MyGame
//
//  Created by 김동준 on 11/23/24
//

import ComposableArchitecture
import Foundation

public struct MyGameFeature: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init() {}
        var isGameAddFloatingMessageVisible: Bool = false
        @BindingState var selectedDate: Date = .now
        var isDatePickerVisible: Bool = false
    }
    
    public enum Action: BindableAction {
        case onAppear
        case binding(BindingAction<State>)
        case dateArrowLeftButtonTapped
        case dateArrowRightButtonTapped
        case datePickerButtonTapped
        case navigateToMyGameAddCategory
    }
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
            case .binding:
                return .none
            case .dateArrowLeftButtonTapped:
                return .none
            case .dateArrowRightButtonTapped:
                return .none
            case .datePickerButtonTapped:
                state.isDatePickerVisible.toggle()
                return .none
            case .navigateToMyGameAddCategory:
                return .none
            }
        }
    }
}
