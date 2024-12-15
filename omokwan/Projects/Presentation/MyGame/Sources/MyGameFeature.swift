//
//  MyGameFeature.swift
//  MyGame
//
//  Created by 김동준 on 11/23/24
//

import ComposableArchitecture
import Foundation
import Domain

public struct MyGameFeature: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init() {}
        @BindingState var selectedDate: Date = .now
        @PresentationState var myGameSheet: MyGameSheetFeature.State?
        
        var isDatePickerVisible: Bool = false
        var myGameList: [MyGameModel?] = Array(repeating: nil, count: 6)
        
        var isGameAddFloatingMessageVisible: Bool {
            return !myGameList.contains(where: { $0 != nil })
        }
    }
    
    public enum Action: BindableAction {
        case onAppear
        case binding(BindingAction<State>)
        case dateArrowLeftButtonTapped
        case dateArrowRightButtonTapped
        case datePickerButtonTapped
        case navigateToMyGameAddCategory
        case bellButtonTapped
        case myGameSheet(PresentationAction<MyGameSheetFeature.Action>)
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
                state.myGameSheet = .init(selectedDate: state.selectedDate)
                return .none
            case .navigateToMyGameAddCategory:
                return .none
            case .myGameSheet(let action):
                switch action {
                case .presented(let sheetAction):
                    switch sheetAction {
                    case .dismissSheetWithData(let date):
                        state.myGameSheet = nil
                        state.selectedDate = date
                        return .none
                    default:
                        return .none
                    }
                case .dismiss:
                    return .none
                }
            case .bellButtonTapped:
                // 임시 로직
                let randomValue: Int = Int.random(in: 0...2)
                var myGameCompleteStatus: MyGameCompleteStatus = .complete
                if randomValue == 0 {
                    myGameCompleteStatus = .complete
                } else if randomValue == 1 {
                    myGameCompleteStatus = .inComplete
                } else {
                    myGameCompleteStatus = .inCompleteWithSkip
                }
                addSingleValueToMyGameList(
                    MyGameModel(myGameCompleteStatus: myGameCompleteStatus),
                    state: &state
                )
                
                checkAndAppendNilIfNeeded(state: &state)
                return .none
            }
        }
        .ifLet(\.$myGameSheet, action: /MyGameFeature.Action.myGameSheet) {
            MyGameSheetFeature()
        }
    }
}

private extension MyGameFeature {
    func addSingleValueToMyGameList(_ value: MyGameModel, state: inout State) {
        if let index = state.myGameList.firstIndex(where: { $0 == nil }) {
            state.myGameList[index] = value
        } else {
            state.myGameList.append(value)
        }
    }
    
    func addListValueToMyGameList(_ list: [MyGameModel], state: inout State) {
        for singleValue in list {
            addSingleValueToMyGameList(singleValue, state: &state)
        }
    }
    
    func checkAndAppendNilIfNeeded(state: inout State) {
        if (state.myGameList.count % 2 == 1) && (state.myGameList.count > 6) {
            state.myGameList.append(nil)
        }
    }
}
