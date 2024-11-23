//
//  MainCoordinatorRootView.swift
//  Main
//
//  Created by 김동준 on 11/20/24
//

import ComposableArchitecture
import SwiftUI
import MyGame

public struct MainCoordinatorRootView: View {
    let store: StoreOf<MainCoordinatorFeature>
    @ObservedObject var viewStore: ViewStoreOf<MainCoordinatorFeature>

    public init(store: StoreOf<MainCoordinatorFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        NavigationStackStore(store.scope(state: \.path, action: MainCoordinatorFeature.Action.path)) {
            MainView(
                store: .init(
                    initialState: MainFeature.State(),
                    reducer: { MainFeature() }
                )
            )
        } destination: { store in
            switch store {
            case .myGame:
                CaseLet(/MainCoordinatorFeature.MainPath.State.myGame, action: MainCoordinatorFeature.MainPath.Action.myGame) { store in
                    MyGameView(store: store)
                }
            }
        }
    }
}
