//
//  MainCoordinatorView.swift
//  Main
//
//  Created by 김동준 on 10/7/24
//

import SwiftUI

public struct MainCoordinatorView: View {
    @StateObject private var mainCoordinator = MainCoordinator(rootScreen: .constant(.main))
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $mainCoordinator.navigationPath) {
            mainCoordinator.view(.main)
            .navigationDestination(for: MainScreen.self) { screen in
                mainCoordinator.view(screen)
            }
        }
    }
}
