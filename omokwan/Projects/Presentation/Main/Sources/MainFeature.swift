//
//  MainFeature.swift
//  Main
//
//  Created by 김동준 on 11/20/24
//

import Foundation
import ComposableArchitecture
import MyGame

public struct MainFeature: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init() {}
        
        var selectedTab: MainBottomTabItem = .myGame
        @PresentationState var addGameSheet: AddGameSheetFeature.State?
//        var myGameState: MyGameFeature.State = .init()
    }
    
    public enum Action {
        case selectTab(MainBottomTabItem)
        case addGameSheet(PresentationAction<AddGameSheetFeature.Action>)
        case addGameButtonTapped
//        case myGameAction(MyGameFeature.Action)
        case noAction
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .selectTab(let item):
                state.selectedTab = item
                return .none
            case .addGameSheet(let presentationAction):
                switch presentationAction {
                case .presented(let sheetAction):
                    switch sheetAction {
                    case .addGameSheetButtonTapped:
                        return .none
                    case .navigateToMyGameAdd:
                        state.addGameSheet = nil
                        return .concatenate([
                            .run { send in
                                await send(waitOneSeconds())
                            }
//                            .send(.myGameAction(.navigateToMyGameAdd))
                        ])
                    default:
                        return .none
                    }
                default:
                    return .none
                }
//            case .myGameAction:
//                return .none
            case .addGameButtonTapped:
                state.addGameSheet = .init()
                return .none
            case .noAction:
                return .none
            }
        }
        .ifLet(\.$addGameSheet, action: /MainFeature.Action.addGameSheet) {
            AddGameSheetFeature()
        }
//        Scope(state: \.myGameState, action: /Action.myGameAction, child: {
//            MyGameFeature()
//        })
    }
}

private extension MainFeature {
    func waitOneSeconds() async -> Action {
        do {
            let _ = try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            return .noAction
        } catch {
            return .noAction
        }
    }
}
