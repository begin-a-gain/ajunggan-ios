//
//  MainStore.swift
//  Main
//
//  Created by 김동준 on 10/3/24
//

import Base

public struct MainState {
    public init() {}
}

public enum MainAction {
    
}

public class MainStore: Reducer<MainState, MainAction> {
    public init() {
        super.init(initialState: MainState())
    }
        
    public override func reduce(state: inout MainState, action: MainAction) -> Effect<MainAction> {
        switch action {
            
        }
    }
}
