//
//  RootCoordinator.swift
//  Root
//
//  Created by 김동준 on 8/24/24
//

import SwiftUI
import Domain
import DI
import Base
import SignIn

final class RootCoordinator: BaseCoordinator<RootScreen> {
    let accountUseCaseProtocol: AccountUseCaseProtocol = DIContainer.shared.resolve()
    let socialUseCaseProtocol: SocialUseCaseProtocol = DIContainer.shared.resolve()

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
                },
                navigateToOpenTermsAndConditionsOfUse: {
                    self.navigateToOpenTermsAndConditionsOfUse()
                },
                navigateToOpenPersonalInformationProcessingPolicy: {
                    self.navigateToOpenPersonalInformationProcessingPolicy()
                }
            ),
            viewStore: SignInStore(
                accountUseCaseProtocol: accountUseCaseProtocol,
                socialUseCaseProtocol: socialUseCaseProtocol
            )
        )
    }
    
    private func navigateToOpenTermsAndConditionsOfUse() {
        if let url = URL(string: "https://www.naver.com") {
            UIApplication.shared.open(url)
        }
    }
    
    private func navigateToOpenPersonalInformationProcessingPolicy() {
        if let url = URL(string: "https://www.google.com") {
            UIApplication.shared.open(url)
        }
    }
}
