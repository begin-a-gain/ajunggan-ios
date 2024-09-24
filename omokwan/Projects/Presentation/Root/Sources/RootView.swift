//
//  RootView.swift
//  Root
//
//  Created by 김동준 on 8/24/24
//

import SwiftUI

public struct RootView: View {
    @StateObject private var rootNavigationPath = RootNavigationPath(path: NavigationPath())
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $rootNavigationPath.path) {
            Group {
                RootCoordinator(
                    navigationPath: $rootNavigationPath.path,
                    screen: .signIn
                ).view()
            }
            .navigationDestination(for: RootCoordinator.self) { coordinator in
                coordinator.view()
            }
        }
    }
}
