//
//  MainCoordinatorFeature.swift
//  Main
//
//  Created by 김동준 on 10/3/24
//

import Base
import ComposableArchitecture
import MyGame
import MyGameAdd

public struct MainCoordinatorFeature: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init() {}

        var path: StackState<MainPath.State> = .init()
        
        // MARK: Main State
        var selectedTab: MainBottomTabItem = .myGame
        @PresentationState var mainSheet: MainSheetFeature.State?
        var myGameState: MyGameFeature.State = .init()
    }

    public enum Action {
        case path(StackAction<MainPath.State, MainPath.Action>)
        
        // MARK: Main Action
        case selectTab(MainBottomTabItem)
        case mainSheet(PresentationAction<MainSheetFeature.Action>)
        case addGameButtonTapped
        case noAction
        case navigateToMyGameAddCategory
        case navigateToMyGameParticipate
        case myGameAction(MyGameFeature.Action)
    }

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .selectTab(let item):
                state.selectedTab = item
                return .none
            case .mainSheet(let presentationAction):
                switch presentationAction {
                case .presented(let sheetAction):
                    switch sheetAction {
                    case .navigateToMyGameAddCategory:
                        state.mainSheet = nil
                        return .concatenate([
                            .run { send in
                                await send(waitFewSeconds())
                            },
                            .send(.navigateToMyGameAddCategory)
                        ])
                    case .navigateToMyGameParticipate:
                        state.mainSheet = nil
                        return .concatenate([
                            .run { send in
                                await send(waitFewSeconds())
                            },
                            .send(.navigateToMyGameParticipate)
                        ])
                    default:
                        return .none
                    }
                default:
                    return .none
                }
            case .navigateToMyGameAddCategory:
                state.path.append(.myGameAddCategory(.init()))
                return .none
            case .navigateToMyGameParticipate:
                // TODO: 대국 참여하기 이동 로직 필요
                return .none
            case .addGameButtonTapped:
                state.mainSheet = .init()
                return .none
            case .noAction:
                return .none
            case .myGameAction:
                return .none
            case .path(.element(id: _, action: MainCoordinatorFeature.MainPath.Action.myGame(let myGameAction))):
                return myGameNavigation(&state, myGameAction)
            case .path(.element(id: _, action: MainCoordinatorFeature.MainPath.Action.myGameAddCategory(let myGameAddCategoryAction))):
                return myGameAddCategoryNavigation(&state, myGameAddCategoryAction)
            case .path(.element(id: _, action: MainCoordinatorFeature.MainPath.Action.myGameAdd(let myGameAddAction))):
                return myGameAddNavigation(&state, myGameAddAction)
            case .path:
                return .none
            }
        }
        .ifLet(\.$mainSheet, action: /MainCoordinatorFeature.Action.mainSheet) {
            MainSheetFeature()
        }
        .forEach(\.path, action: /MainCoordinatorFeature.Action.path) {
            MainPath()
        }
        Scope(state: \.myGameState, action: /MainCoordinatorFeature.Action.myGameAction) {
            MyGameFeature()
        }
    }
}

private extension MainCoordinatorFeature {
    func waitFewSeconds() async -> Action {
        do {
            try await Task.sleep(for: .seconds(0.1))
            return .noAction
        } catch {
            return .noAction
        }
    }
}
