//
//  MainView.swift
//  Main
//
//  Created by 김동준 on 10/1/24
//

import SwiftUI
import DesignSystem
import ComposableArchitecture

public struct MainView: View {
    let store: StoreOf<MainFeature>
    @ObservedObject var viewStore: ViewStoreOf<MainFeature>

    public init(store: StoreOf<MainFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        ZStack {
            mainContentView
                .ignoresSafeArea(edges: .bottom)
            
            MainBottomTabBarShape()
                .fill(OColors.oWhite.swiftUIColor)
                .shadow(
                    color: OColors.oPrimary.swiftUIColor.opacity(0.3),
                    radius: 20,
                    x: 0, y: 0
                )
                .height(MainConstants.bottomTabBarHeight)
                .greedyHeight(.bottom)
                .ignoresSafeArea(edges: .bottom)
            
            MainBottomTabBarView(viewStore: viewStore)
                .height(MainConstants.bottomTabBarHeight)
                .greedyHeight(.bottom)
                .ignoresSafeArea(edges: .bottom)
        }
    }
    
    private var mainContentView: some View {
        Group {
            switch viewStore.state.selectedTab {
            case .myGame:
                HomeView(store: .init(initialState: HomeFeature.State(), reducer: { HomeFeature() }))
                    .padding(.bottom, MainConstants.bottomTabBarHeight)
            case .myPage:
                ProfileView()
                    .padding(.bottom, MainConstants.bottomTabBarHeight)
            }
        }
    }
}

// TODO: Remove This View
public struct HomeView: View {
    let store: StoreOf<HomeFeature>
    @ObservedObject var viewStore: ViewStoreOf<HomeFeature>

    public init(store: StoreOf<HomeFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        ScrollView {
            ForEach(0..<40) { _ in
                Text("Home View").greedyWidth()
            }
            
            Button {

            } label: {
                Text("Navigate To Depth View")
            }
        }
    }
}

public struct HomeFeature: Reducer {
    public struct State: Equatable {
        
    }
    
    public enum Action {
        
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}

// TODO: Remove This View
public struct HomeDetailView: View {
    public var body: some View {
        VStack {
            Text("Home Detail View")
            Button {

            } label: {
                Text("Return To Sign In")
            }
        }
    }
}

// TODO: Remove This View
public struct ProfileView: View {
    public var body: some View {
        VStack {
            Text("Profile View")
            Button {
                
            } label: {
                Text("Logout")
            }
        }
    }
}

