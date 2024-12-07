//
//  MyGameAddFeature.swift
//  MyGameAdd
//
//  Created by 김동준 on 11/30/24
//

import ComposableArchitecture
import Domain

public struct MyGameAddFeature: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init() {}
        var isStartButtonEnable: Bool = false
        @BindingState var gameName: String = ""
        var selectedRepeatDay: MyGameAddRepeatDayType = .weekday
        var directSelectionTypeList: [MyGameAddDirectSelectionDayType] = MyGameAddDirectSelectionDayType.allCases
        var isSelectedDirectSelectionList: [Bool] = Array(repeating: true, count: MyGameAddDirectSelectionDayType.allCases.count)
        var maxNumOfPeople: Int = 0
        var selectedCategory: GameCategory?
        @BindingState var isRemindAlarmSelected: Bool = false
        @BindingState var isPrivateRoomSelected: Bool = false
        var privateRoomPassword: String = "0000"
    }
    
    public enum Action: BindableAction {
        case navigateToBack
        case binding(BindingAction<State>)
        case repeatDayButtonTapped
        case directSelectionListButtonTapped(Int)
        case maxNumOfPeopleButtonTapped
    }
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .navigateToBack:
                return .none
            case .binding:
                return .none
            case .repeatDayButtonTapped:
                // Implement Sheet present
                return .none
            case .directSelectionListButtonTapped(let index):
                state.isSelectedDirectSelectionList[index].toggle()
                return .none
            case .maxNumOfPeopleButtonTapped:
                return .none
            }
        }
    }
}
