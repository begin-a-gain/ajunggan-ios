//
//  RootCoordinatorView.swift
//  Root
//
//  Created by 김동준 on 8/24/24
//

import SwiftUI

extension RootCoordinator {
    @ViewBuilder
    func view() -> some View {
        switch self.screen {
        case .signIn:
            signInView()
        }
    }
}

extension RootCoordinator {
    private func signInView() -> some View {
        return VStack {
            Text("This is SignIn Example View")
        }
    }
}
