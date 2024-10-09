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
    @StateObject private var rootCoordinator = RootCoordinator(rootScreen: .constant(.signIn))

    public init() {}
    
    public var body: some View {
        NavigationStack(path: $rootCoordinator.navigationPath) {
            Group {
                if rootCoordinator.rootScreen == .main {
                    rootCoordinator.view(.main)
                } else {
                    rootCoordinator.view(.signIn)
                }
            }
            .navigationDestination(for: RootScreen.self) { screen in
                rootCoordinator.view(screen)
            }
        }
    }
}
