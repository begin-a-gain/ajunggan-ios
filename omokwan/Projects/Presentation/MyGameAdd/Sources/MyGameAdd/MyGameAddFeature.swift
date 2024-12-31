//
//  MyGameAddFeature.swift
//  MyGameAdd
//
//  Created by 김동준 on 11/30/24
//

import ComposableArchitecture
import Domain
import Base

public struct MyGameAddFeature: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init(selectedCategory: GameCategory?) {
            self.selectedCategory = selectedCategory
        }
        
        // MARK: Alert
        public enum AlertCase {
            case password
            case create
        }
        var alertCase: AlertCase?
        var alertState: AlertFeature.State = .init()
        
        // MARK: Password Focus Field
        public enum PasswordFocusField {
            case thousandsPlace
            case hundredsPlace
            case tensPlace
            case onesPlace
        }
        
        @BindingState var gameName: String = ""
        var selectedRepeatDay: MyGameAddRepeatDayType = .weekday
        var directSelectionTypeList: [MyGameAddDirectSelectionDayType] = MyGameAddDirectSelectionDayType.allCases
        var isSelectedDirectSelectionList: [Bool] = Array(repeating: false, count: MyGameAddDirectSelectionDayType.allCases.count)
        var maxNumOfPeople: Int = 5
        var selectedCategory: GameCategory?
        @BindingState var isRemindAlarmSelected: Bool = false
        
        @PresentationState var repeatDaySheet: MyGameRepeatDaySheetFeature.State?
        @PresentationState var maxNumOfPeopleSheet: MyGameMaxNumOfPeopleSheetFeature.State?
        @PresentationState var gameCategorySheet: MyGameCategorySheetFeature.State?
        
        // MARK: 비공개 설정
        @BindingState var isPrivateRoomSelected: Bool = false
        var privateRoomPassword: String?
        @BindingState var thousandsPlace: String = ""
        @BindingState var hundredsPlace: String = ""
        @BindingState var tensPlace: String = ""
        @BindingState var onesPlace: String = ""
        
        var isStartButtonEnable: Bool {
            return !gameName.isEmpty
        }
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
        case privateRoomToggleButtonTapped
        case alertAction(AlertFeature.Action)
        case showAlert(State.AlertCase)
        case passwordAlertConfirmButtonTapped
        case passwordAlertCancelButtonTapped
        case passwordRefresh
        case privateRoomCodeButtonTapped
        case gameStartButtonTapped
        case createAlertCancelButtonTapped
        case createAlertConfirmButtonTapped
        case createRoomComplete(String)
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
            case .privateRoomToggleButtonTapped:
                if state.isPrivateRoomSelected {
                    state.isPrivateRoomSelected = false
                } else {
                    if let _ = state.privateRoomPassword {
                        state.isPrivateRoomSelected = true
                    } else {
                        return .send(.showAlert(.password))
                    }
                }
                return .none
            case .alertAction:
                return .none
            case .showAlert(let alertCase):
                state.alertCase = alertCase
                return .send(.alertAction(.present))
            case .passwordAlertConfirmButtonTapped:
                guard let thousands = Int(state.thousandsPlace),
                      let hundreds = Int(state.hundredsPlace),
                      let tens = Int(state.tensPlace),
                      let ones = Int(state.onesPlace)
                else { return .none }
                
                let password = (1000 * thousands) + (100 * hundreds) + (10 * tens) + ones
                state.privateRoomPassword = String(password)
                state.isPrivateRoomSelected = true
                
                return .send(.alertAction(.dismiss))
            case .passwordAlertCancelButtonTapped:
                return .send(.alertAction(.dismiss))
            case .passwordRefresh:
                state.thousandsPlace = ""
                state.hundredsPlace = ""
                state.tensPlace = ""
                state.onesPlace = ""
                return .none
            case .privateRoomCodeButtonTapped:
                if let _ = state.privateRoomPassword {
                    if state.isPrivateRoomSelected {
                        return .send(.showAlert(.password))
                    }
                }
                
                return .none
            case .gameStartButtonTapped:
                return .send(.showAlert(.create))
            case .createAlertCancelButtonTapped:
                return .send(.alertAction(.dismiss))
            case .createAlertConfirmButtonTapped:
                let title = state.gameName
                return .merge([
                    .send(.alertAction(.dismiss)),
                    .send(.createRoomComplete(title))
                ])
            case .createRoomComplete:
                return .none
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
        Scope(state: \.alertState, action: /MyGameAddFeature.Action.alertAction) {
            AlertFeature()
        }
    }
}
