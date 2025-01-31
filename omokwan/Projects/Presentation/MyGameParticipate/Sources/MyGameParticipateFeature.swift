//
//  MyGameParticipateFeature.swift
//  MyGameParticipate
//
//  Created by 김동준 on 1/1/25
//

import ComposableArchitecture

@Reducer
public struct MyGameParticipateFeature {
    public init() {}
    
    public struct State: Equatable {
        public init() {}
        
        enum CategoryFilterType {
            case availableRoom
            case category
        }
        
        @BindingState var searchText: String = ""
        
        var isResetFilterButtonVisible: Bool {
            return isAvailableParticipateRoomSelected || isCategoryFilterSelected
        }
        
        // About Filter
        var isAvailableParticipateRoomSelected: Bool = false
        var numOfCategory: Int = 0
        var isCategoryFilterSelected: Bool = false
    }
    
    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case navigateToBack
        case resetFilterButtonTapped
        case availableParticipateRoomFilterTapped
        case categoryFilterTapped
    }
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .navigateToBack:
                return .none
            case .resetFilterButtonTapped:
                state.isAvailableParticipateRoomSelected = false
                state.isCategoryFilterSelected = false
                return .none
            case .availableParticipateRoomFilterTapped:
                state.isAvailableParticipateRoomSelected.toggle()
                return .none
            case .categoryFilterTapped:
                state.isCategoryFilterSelected = true
                return .none
            }
        }
    }
}
