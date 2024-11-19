//
//  MainView.swift
//  Main
//
//  Created by 김동준 on 10/1/24
//

import SwiftUI
import DesignSystem

public struct MainView: View {
    private let coordinator:  MainCoordinator
    @ObservedObject var viewStore: MainStore
    
    public init(
        coordinator: MainCoordinator,
        viewStore: MainStore
    ) {
        self.coordinator = coordinator
        self.viewStore = viewStore
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
                HomeView(coordinator: coordinator)
                    .padding(.bottom, MainConstants.bottomTabBarHeight)
            case .myPage:
                ProfileView(coordinator: coordinator)
                    .padding(.bottom, MainConstants.bottomTabBarHeight)
            }
        }
    }
}

// TODO: Remove This View
public struct HomeView: View {
    private let coordinator: MainView.MainCoordinator
    
    public init(coordinator: MainView.MainCoordinator) {
        self.coordinator = coordinator
    }
    
    public var body: some View {
        ScrollView {
            ForEach(0..<40) { _ in
                Text("Home View").greedyWidth()
            }
            
            Button {
                coordinator.navigateToDepth()
            } label: {
                Text("Navigate To Depth View")
            }
        }
    }
}

// TODO: Remove This View
public struct HomeDetailView: View {
    private let coordinator: MainView.MainCoordinator
    
    public init(coordinator: MainView.MainCoordinator) {
        self.coordinator = coordinator
    }
    
    public var body: some View {
        VStack {
            Text("Home Detail View")
            Button {
                coordinator.navigateToDepth()
            } label: {
                Text("Return To Sign In")
            }
        }
    }
}

// TODO: Remove This View
public struct ProfileView: View {
    private let coordinator: MainView.MainCoordinator

    public init(coordinator: MainView.MainCoordinator) {
        self.coordinator = coordinator
    }
    
    public var body: some View {
        VStack {
            Text("Profile View")
            Button {
                coordinator.navigateToRoot()
            } label: {
                Text("Logout")
            }
        }
    }
}

// TODO: Remove This View
public struct DepthView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Text("DepthView View")
        }
    }
}
