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
                .padding(.bottom, MainConstants.bottomTabBarHeight)
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
            case .feed:
                FeedView()
            case .myPage:
                ProfileView(coordinator: coordinator)
            }
        }
    }
}

private struct MainBottomTabBarView: View {
    @ObservedObject fileprivate var viewStore: MainStore
    
    fileprivate init(viewStore: MainStore) {
        self.viewStore = viewStore
    }
    
    fileprivate var body: some View {
        ZStack(alignment: .top) {
            cornerView
            tabItems
        }
        .height(MainConstants.bottomTabBarHeight)
        .greedyWidth()
    }
    
    private var cornerView: some View {
        RoundedCorner(radius: 20, corners: [.topLeft, .topRight]) // TODO: radius 시안 나오면 변경
            .fill(Color.white)
            .greedyWidth()
            .height(MainConstants.bottomTabBarHeight)
            .shadow(color: .orange.opacity(0.2), radius: 5, x:0, y: -5) // TODO: Color, shadow 시안 나오면 변경
            .overlay(
                RoundedCorner(radius: 20, corners: [.topLeft, .topRight])
                    .stroke(.blue, lineWidth: 1) // TODO: Color 시안 나오면 변경
            )
    }
    
    private var tabItems: some View {
        HStack(alignment: .top, spacing: 0) {
            ForEach(MainState.TabItem.allCases, id: \.self) { item in
                BottomTabItem(
                    selectedTab:
                        Binding(
                            get: { viewStore.state.selectedTab },
                            set: { _ in }
                        ),
                    item: item,
                    action: tabTouchAction(tab: item)
                )
            }
        }
    }
    
    private func tabTouchAction(tab: MainState.TabItem) -> () -> Void {
        switch tab {
        case .myGame:
            return { viewStore.send(.selectTab(.myGame)) }
        case .feed:
            return { viewStore.send(.selectTab(.feed)) }
        case .myPage:
            return { viewStore.send(.selectTab(.myPage)) }
        }
    }
}

private struct BottomTabItem: View {
    @Binding var selectedTab : MainState.TabItem
    let item: MainState.TabItem
    let action: () -> (Void)
    
    init(
        selectedTab: Binding<MainState.TabItem>,
        item: MainState.TabItem,
        action: @escaping () -> Void
    ) {
        self._selectedTab = selectedTab
        self.item = item
        self.action = action
    }
    
    fileprivate var body : some View {
        VStack (spacing:0) {
            Spacer().height(12)
            Button {
                action()
            } label: {
                VStack(spacing: 4) {
                    getImage(item: item)
                        .renderingMode(.template).foregroundColor(item == selectedTab ? .black : .gray)
                    OText(
                        item.rawValue,
                        token: .title_01,
                        color: item == selectedTab ? .black : .gray // TODO: 컬러 바꾸기
                    )
                }
            }.greedyWidth()
        }.height(MainConstants.bottomTabBarHeight, .top)
    }
    
    // TODO: 이미지랑 컬러 바꿀 것
    private func getImage(item: MainState.TabItem) -> Image {
        switch item {
        case .myGame:
            OImage.icKakao.swiftUIImage
        case .feed:
            OImage.icArrowLeft.swiftUIImage
        case .myPage:
            OImage.icApple.swiftUIImage
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

// TODO: Remove This View
public struct FeedView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Text("Feed View")
        }
    }
}
