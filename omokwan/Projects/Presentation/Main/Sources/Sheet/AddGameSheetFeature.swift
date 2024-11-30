//
//  AddGameSheetFeature.swift
//  Main
//
//  Created by 김동준 on 11/24/24
//

import ComposableArchitecture

public struct AddGameSheetFeature: Reducer {
    public struct State: Equatable {
        public enum AddGameType: CaseIterable {
            case add
            case participate
        }
        
        var selectedGameType: AddGameType? = nil
    }
    
    public enum Action {
        case selectType(State.AddGameType)
        case addGameSheetButtonTapped
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .selectType(let type):
                state.selectedGameType = type
                return .none
            case .addGameSheetButtonTapped:
                // TODO: Implement
                return .none
            }
        }
    }
}
