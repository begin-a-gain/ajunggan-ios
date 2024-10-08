//
//  MainStore.swift
//  Main
//
//  Created by 김동준 on 10/3/24
//

import Base

public struct MainState {
    public init() {}
    
    public enum TabItem: String {
        case home = "홈"
        case profile = "프로필"
    }
    
    var selectedTab: TabItem = .home
}

public enum MainAction {
    case selectTab(MainState.TabItem)
}

public class MainStore: Reducer<MainState, MainAction> {
    public init() {
        super.init(initialState: MainState())
    }
        
    public override func reduce(state: inout MainState, action: MainAction) -> Effect<MainAction> {
        switch action {
        case .selectTab(let item):
            state.selectedTab = item
            return .none
        }
    }
}
