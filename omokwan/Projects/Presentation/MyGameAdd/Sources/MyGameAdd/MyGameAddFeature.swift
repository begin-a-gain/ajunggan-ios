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
        public init(selectedCategory: GameCategory?) {
            self.selectedCategory = selectedCategory
        }
        var isStartButtonEnable: Bool = false
        @BindingState var gameName: String = ""
        var selectedRepeatDay: MyGameAddRepeatDayType = .weekday
        var directSelectionTypeList: [MyGameAddDirectSelectionDayType] = MyGameAddDirectSelectionDayType.allCases
        var isSelectedDirectSelectionList: [Bool] = Array(repeating: true, count: MyGameAddDirectSelectionDayType.allCases.count)
        var maxNumOfPeople: Int = 5
        var selectedCategory: GameCategory?
        @BindingState var isRemindAlarmSelected: Bool = false
        @BindingState var isPrivateRoomSelected: Bool = false
        var privateRoomPassword: String = "0000"
        
        @PresentationState var repeatDaySheet: MyGameRepeatDaySheetFeature.State?
        @PresentationState var maxNumOfPeopleSheet: MyGameMaxNumOfPeopleSheetFeature.State?
        @PresentationState var gameCategorySheet: MyGameCategorySheetFeature.State?
    }
    
    public enum Action: BindableAction {
        case navigateToBack
        case binding(BindingAction<State>)
        case repeatDayButtonTapped
        case directSelectionListButtonTapped(Int)
        case maxNumOfPeopleButtonTapped
        case gameCategorySettingButtonTapped
        case repeatDaySheet(PresentationAction<MyGameRepeatDaySheetFeature.Action>)
        case maxNumOfPeopleSheet(PresentationAction<MyGameMaxNumOfPeopleSheetFeature.Action>)
        case gameCategorySheet(PresentationAction<MyGameCategorySheetFeature.Action>)
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
                state.repeatDaySheet = .init(selectedRepeatDayValue: state.selectedRepeatDay)
                return .none
            case .repeatDaySheet(let action):
                switch action {
                case .presented(let presentAction):
                    switch presentAction {
                    case .selectButtonTapped(let repeatDay):
                        state.repeatDaySheet = nil
                        state.selectedRepeatDay = repeatDay
                        return .none
                    default:
                        return .none
                    }
                default:
                    return .none
                }
            case .directSelectionListButtonTapped(let index):
                state.isSelectedDirectSelectionList[index].toggle()
                return .none
            case .maxNumOfPeopleButtonTapped:
                state.maxNumOfPeopleSheet = .init(selectedMaxNumOfPeopleCount: state.maxNumOfPeople)
                return .none
            case .maxNumOfPeopleSheet(let action):
                switch action {
                case .presented(let presentAction):
                    switch presentAction {
                    case .selectButtonTapped(let value):
                        state.maxNumOfPeopleSheet = nil
                        state.maxNumOfPeople = value
                        return .none
                    default:
                        return .none
                    }
                default:
                    return .none
                }
            case .gameCategorySettingButtonTapped:
                state.gameCategorySheet = .init(selectedCategory: state.selectedCategory)
                return .none
            case .gameCategorySheet(let action):
                switch action {
                case .presented(let presentAction):
                    switch presentAction {
                    case .selectButtonTapped(let value):
                        state.gameCategorySheet = nil
                        state.selectedCategory = value
                        return .none
                    default:
                        return .none
                    }
                default:
                    return .none
                }
            }
        }
        .ifLet(\.$repeatDaySheet, action: /MyGameAddFeature.Action.repeatDaySheet) {
            MyGameRepeatDaySheetFeature()
        }
        .ifLet(\.$maxNumOfPeopleSheet, action: /MyGameAddFeature.Action.maxNumOfPeopleSheet) {
            MyGameMaxNumOfPeopleSheetFeature()
        }
        .ifLet(\.$gameCategorySheet, action: /MyGameAddFeature.Action.gameCategorySheet) {
            MyGameCategorySheetFeature()
        }
    }
}
