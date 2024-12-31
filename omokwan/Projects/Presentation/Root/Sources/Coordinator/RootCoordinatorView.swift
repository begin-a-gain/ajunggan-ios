//
//  RootCoordinatorView.swift
//  Root
//
//  Created by 김동준 on 11/20/24
//

import SwiftUI
import ComposableArchitecture
import Main
import SignIn
import SignUp
import MyGame

public struct RootCoordinatorView: View {
    let store: StoreOf<RootCoordinatorFeature>
    @ObservedObject var viewStore: ViewStoreOf<RootCoordinatorFeature>

    public init(store: StoreOf<RootCoordinatorFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        if viewStore.isAuth {
            MainCoordinatorRootView(
                store: .init(initialState: MainCoordinatorFeature.State(), reducer: { MainCoordinatorFeature() })
            )
        } else {
            rootView
        }
    }
    
    private var rootView: some View {
        NavigationStackStore(store.scope(state: \.path, action: RootCoordinatorFeature.Action.path)) {
            RootView()
        } destination: { store in
            switch store {
            case .signIn:
                CaseLet(/RootCoordinatorFeature.RootPath.State.signIn, action: RootCoordinatorFeature.RootPath.Action.signIn) { store in
                    SignInView(store: store)
                }
            case .signUp:
                CaseLet(/RootCoordinatorFeature.RootPath.State.signUp, action: RootCoordinatorFeature.RootPath.Action.signUp) { store in
                    SignUpView(store: store)
                }
            case .signUpDone:
                CaseLet(/RootCoordinatorFeature.RootPath.State.signUpDone, action: RootCoordinatorFeature.RootPath.Action.signUpDone) { store in
                    SignUpDoneView(store: store)
                }
            }
        }
    }
}
