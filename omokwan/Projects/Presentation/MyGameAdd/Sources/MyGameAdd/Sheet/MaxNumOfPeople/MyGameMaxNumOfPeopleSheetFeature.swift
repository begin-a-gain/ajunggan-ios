//
//  MyGameMaxNumOfPeopleSheetFeature.swift
//  MyGameAdd
//
//  Created by 김동준 on 12/7/24
//

import ComposableArchitecture
import Domain

public struct MyGameMaxNumOfPeopleSheetFeature: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init(selectedMaxNumOfPeopleCount: Int) {
            self.selectedMaxNumOfPeopleCount = selectedMaxNumOfPeopleCount
        }
        
        var maxNumOfPeopleAllCases: [Int] = Array(1...5)
        @BindingState var selectedMaxNumOfPeopleCount: Int
    }
    
    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case selectButtonTapped(Int)
    }
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .selectButtonTapped:
                return .none
            }
        }
    }
}
