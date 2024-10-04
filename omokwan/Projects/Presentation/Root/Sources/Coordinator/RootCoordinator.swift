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
import SignUp
import Main

final class RootCoordinator: BaseCoordinator<RootScreen> {
    let accountUseCaseProtocol: AccountUseCaseProtocol = DIContainer.shared.resolve()
    let socialUseCaseProtocol: SocialUseCaseProtocol = DIContainer.shared.resolve()

    @ViewBuilder
    func view(_ screen: RootScreen) -> some View {
        switch screen {
        case .signIn:
            signInView()
        case .signUp:
            signUpView()
        case .main:
            mainView()
        case .signUpDone:
            signUpDoneView()
        }
    }
}

// MARK: About SignIn
extension RootCoordinator {
    private func signInView() -> some View {
        return SignInView(
            coordinator: .init(
                navigateToMain: {
                    self.rootScreen = .main
                },
                navigateToSignUp: { 
                    self.push(RootScreen.signUp)
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

// MARK: About SignUp
extension RootCoordinator {
    private func signUpView() -> some View {
        return SignUpView(
            coordinator: .init(
                navigateToSignUpDone: {
                    self.push(RootScreen.signUpDone)
                },
                navigateToBack: {
                    self.pop()
                }
            ),
            viewStore: SignUpStore()
        )
    }
}

// MARK: About SignUpDone
extension RootCoordinator {
    private func signUpDoneView() -> some View {
        return SignUpDoneView(
            coordinator: .init(
                navigateToMain: {
                    self.root()
                    self.rootScreen = .main
                }
            )
        )
    }
}

// MARK: About Main
extension RootCoordinator {
    private func mainView() -> some View {
        return MainView()
    }
}
