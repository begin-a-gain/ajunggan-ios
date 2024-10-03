//
//  MainView.swift
//  Main
//
//  Created by 김동준 on 10/1/24
//

import SwiftUI

public struct MainView: View {
    @StateObject private var mainCoordinator = MainCoordinator(rootScreen: .constant(.main))
    @State var selectedTab: Int = 0
    
    public init() {}
    
    public var body: some View {
        mainView
    }
    
    private var mainView: some View {
        TabView(selection: $selectedTab) {
            HomeView(coordinator: mainCoordinator)
            .tabItem {
                Label("홈", systemImage: "house")
            }
            .tag(0)
            ProfileView()
            .tabItem {
                Label("프로필", systemImage: "person")
            }
            .tag(1)
        }
    }
}

// TODO: Remove This View
public struct HomeView: View {
    @StateObject var coordinator: MainCoordinator
    
    public var body: some View {
        NavigationStack(path: $coordinator.homePath) {
            VStack {
                Text("Home View")
                Button {
                    coordinator.homePath.append(HomeScreen.homeDetail)
                } label: {
                    Text("Return To Sign In")
                }
            }
            .navigationDestination(for: HomeScreen.self) { screen in
                coordinator.view(screen)
            }
        }
    }
}

// TODO: Remove This View
public struct HomeDetailView: View {
    public init() {}
    
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
    public init() {}
    
    public var body: some View {
        VStack {
            Text("Profile View")
        }
    }
}
