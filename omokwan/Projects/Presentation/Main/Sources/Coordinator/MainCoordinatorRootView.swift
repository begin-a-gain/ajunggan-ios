//
//  MainCoordinatorRootView.swift
//  Main
//
//  Created by 김동준 on 11/20/24
//

import ComposableArchitecture
import SwiftUI
import MyGame
import MyGameAdd

public struct MainCoordinatorRootView: View {
    let store: StoreOf<MainCoordinatorFeature>
    @ObservedObject var viewStore: ViewStoreOf<MainCoordinatorFeature>

    public init(store: StoreOf<MainCoordinatorFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        NavigationStackStore(store.scope(state: \.path, action: MainCoordinatorFeature.Action.path)) {
            MainView(store: store)
        } destination: { store in
            switch store {
            case .myGame:
                CaseLet(/MainCoordinatorFeature.MainPath.State.myGame, action: MainCoordinatorFeature.MainPath.Action.myGame) { store in
                    MyGameView(store: store)
                }
            case .myGameAdd:
                CaseLet(/MainCoordinatorFeature.MainPath.State.myGameAdd, action: MainCoordinatorFeature.MainPath.Action.myGameAdd) { store in
                    MyGameAddView(store: store)
                }
            case .myGameAddCategory:
                CaseLet(/MainCoordinatorFeature.MainPath.State.myGameAddCategory, action: MainCoordinatorFeature.MainPath.Action.myGameAddCategory) { store in
                    MyGameAddCategoryView(store: store)
                }
            }
        }
    }
}
