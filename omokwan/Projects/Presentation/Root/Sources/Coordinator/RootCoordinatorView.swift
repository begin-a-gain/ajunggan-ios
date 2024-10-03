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
        if rootCoordinator.rootScreen == .main {
            withoutRootCoordinatorView
        } else {
            withRootCoordinatorView
        }
    }
    
    private var withRootCoordinatorView: some View {
        NavigationStack(path: $rootCoordinator.navigationPath) {
            Group {
                switch rootCoordinator.rootScreen {
                case .signIn: rootCoordinator.view(.signIn)
                case .signUp: rootCoordinator.view(.signUp)
                default: EmptyView()
                }
            }
            .navigationDestination(for: RootScreen.self) { screen in
                if screen != .main {
                    rootCoordinator.view(screen)
                }
            }
        }
    }
    
    private var withoutRootCoordinatorView: some View {
        rootCoordinator.view(.main)
    }
}
