//
//  MainCoordinator.swift
//  Main
//
//  Created by 김동준 on 10/1/24
//

import Base
import SwiftUI

final public class MainCoordinator: BaseCoordinator<MainScreen> {
    @Published var homePath: NavigationPath = NavigationPath()
    
    @ViewBuilder
    func view(_ screen: MainScreen) -> some View {
        switch screen {
        case .main:
            mainView(.main)
        }
    }
    
    @ViewBuilder
    func view(_ screen: HomeScreen) -> some View {
        switch screen {
        case .home:
            homeView(.home)
        case .homeDetail:
            homeView(.homeDetail)
        }
    }
}

// MARK: About Main
extension MainCoordinator {
    private func mainView(_ screen: MainScreen) -> some View {
        switch screen {
        case .main:
            return MainView()
        }
    }
}

// MARK: About Home
extension MainCoordinator {
    func homeView(_ screen: HomeScreen) -> some View {
        switch screen {
        case .home:
            return AnyView(
                HomeView(coordinator: self)
            )
        case .homeDetail:
            return AnyView(HomeDetailView())
        }
    }
}
