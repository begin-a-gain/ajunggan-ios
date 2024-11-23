//
//  AddGameSheetFeature.swift
//  Main
//
//  Created by 김동준 on 11/24/24
//

import ComposableArchitecture

public struct AddGameSheetFeature: Reducer {
    public struct State: Equatable {
        
    }
    
    public enum Action {
        
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
