//
//  RootCoordinatorView.swift
//  Root
//
//  Created by 김동준 on 8/24/24
//

import SwiftUI
import SignIn
import Base

public struct RootCoordinatorView: View {
    @StateObject private var rootNavigationPath = RouteNavigationPath<RootScreen>(path: NavigationPath(), screen: .signIn)

    public init() {}
    
    public var body: some View {
        NavigationStack(path: $rootNavigationPath.path) {
            Group {
                RootCoordinator(
                    navigationPath: $rootNavigationPath.path,
                    screen: $rootNavigationPath.screen
                ).view()
            }
            .navigationDestination(for: RootCoordinator.self) { coordinator in
                coordinator.view()
            }
        }
    }
}
