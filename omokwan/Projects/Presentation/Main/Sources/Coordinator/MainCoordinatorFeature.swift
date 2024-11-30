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
        @PresentationState var addGameSheet: AddGameSheetFeature.State?
        var myGameState: MyGameFeature.State = .init()
    }

    public enum Action {
        case path(StackAction<MainPath.State, MainPath.Action>)
        
        // MARK: Main Action
        case selectTab(MainBottomTabItem)
        case addGameSheet(PresentationAction<AddGameSheetFeature.Action>)
        case addGameButtonTapped
        case noAction
        case navigateToMyGameAddCategory
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
                    case .navigateToMyGameAddCategory:
                        state.addGameSheet = nil
                        return .concatenate([
                            .run { send in
                                await send(waitZeroPointFiveSeconds())
                            },
                            .send(.navigateToMyGameAddCategory)
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
            case .addGameButtonTapped:
                state.addGameSheet = .init()
                return .none
            case .noAction:
                return .none
                
            case .path(.element(id: _, action: MainCoordinatorFeature.MainPath.Action.myGame(let myGameAction))):
                return myGameNavigation(&state, myGameAction)
            case .path(.element(id: _, action: MainCoordinatorFeature.MainPath.Action.myGameAddCategory(let myGameAddCategoryAction))):
                return myGameAddCategoryNavigation(&state, myGameAddCategoryAction)
            case .path:
                return .none
            }
        }
        .ifLet(\.$addGameSheet, action: /MainCoordinatorFeature.Action.addGameSheet) {
            AddGameSheetFeature()
        }
        .forEach(\.path, action: /MainCoordinatorFeature.Action.path) {
            MainPath()
        }
    }
}

private extension MainCoordinatorFeature {
    func waitZeroPointFiveSeconds() async -> Action {
        do {
            let _ = try await Task.sleep(nanoseconds: 1 * 500_000_000)
            return .noAction
        } catch {
            return .noAction
        }
    }
}
