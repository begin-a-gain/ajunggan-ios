//
//  MainView.swift
//  Main
//
//  Created by 김동준 on 10/1/24
//

import SwiftUI
import DesignSystem

public struct MainView: View {
    @StateObject private var coordinator:  MainCoordinator
    @StateObject var viewStore: MainStore
    
    public init(
        coordinator: MainCoordinator,
        viewStore: MainStore
    ) {
        self._coordinator = StateObject(wrappedValue: coordinator)
        self._viewStore = StateObject(wrappedValue: viewStore)
    }
    
    public var body: some View {
        ZStack {
            mainContentView
            mainBottomTabBarView
                .height(80)
                .greedyHeight(.bottom)
                .ignoresSafeArea()
        }
    }
    
    private var mainContentView: some View {
        Group {
            switch viewStore.state.selectedTab {
            case .home:
                HomeView(coordinator: coordinator)
            case .profile:
                ProfileView()
            }
        }
    }
    
    private var mainBottomTabBarView: some View {
        ZStack(alignment: .top) {
            Spacer().height(1).background(.gray).opacity(0.2)
            HStack(alignment: .top, spacing: 0) {
                MenuButton(
                    selectedTab:
                        Binding(
                            get: { viewStore.state.selectedTab },
                            set: { _ in }
                        ),
                    item: .home,
                    action: { viewStore.send(.selectTab(.home)) }
                )
                MenuButton(
                    selectedTab:
                        Binding(
                            get: { viewStore.state.selectedTab },
                            set: { _ in }
                        ),
                    item: .profile,
                    action: { viewStore.send(.selectTab(.profile)) }
                )
            }
        }
        .height(80)
        .greedyWidth()
    }
}

private struct MenuButton: View {
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
                    getImage(item: item, isSelected: item == selectedTab)
                    Text(item.rawValue)
                        .font(.system(size: 12))
                        .foregroundStyle(item == selectedTab ? .black : .gray)
                }
            }.greedyWidth()
        }.height(80, .top)
    }
    
    private func getImage(item: MainState.TabItem, isSelected: Bool) -> some View {
        switch item {
        case .home:
            OImage.icKakao.swiftUIImage
                .renderingMode(.template).foregroundColor(isSelected ? .black : .gray)
        case .profile:
            OImage.icApple.swiftUIImage
                .renderingMode(.template).foregroundColor(isSelected ? .black : .gray)
        }
    }
}

// TODO: Remove This View
public struct HomeView: View {
    @StateObject var coordinator: MainCoordinator
    
    public init(coordinator: MainCoordinator) {
        self._coordinator = StateObject(wrappedValue: coordinator)
    }
    
    public var body: some View {
        ZStack {
            VStack {
                Text("Home View")
                Button {
                    coordinator.push(MainScreen.depth)
                    print("DONGJUN \(coordinator.navigationPath)")
                } label: {
                    Text("Navigate To Depth View")
                }
            }
        }
    }
}

// TODO: Remove This View
public struct HomeDetailView: View {
    @StateObject var coordinator: MainCoordinator
    
    public var body: some View {
        VStack {
            Text("Home Detail View")
            Button {
                coordinator.push(MainScreen.depth)
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

// TODO: Remove This View
public struct DepthView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Text("DepthView View")
        }
    }
}
