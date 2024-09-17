//
//  RootCoordinatorView.swift
//  Root
//
//  Created by 김동준 on 8/24/24
//

import SwiftUI
import SignIn

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
        return SignInView(
            coordinator: .init(
                navigateToMain: { testMessage in
                    // TODO: push Main Page with parameter
                }
            ),
            signInViewModel: SignInViewModel(
                accountUseCaseProtocol: accountUseCaseProtocol
            )
        )
    }
}
