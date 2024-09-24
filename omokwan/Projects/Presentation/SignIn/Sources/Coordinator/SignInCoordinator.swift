//
//  SignInCoordinator.swift
//  SignIn
//
//  Created by 김동준 on 8/25/24
//

extension SignInView {
    public struct SignInCoordinator {
        public init(navigateToMain: @escaping (String) -> Void) {
            self.navigateToMain = navigateToMain
        }
        
        let navigateToMain: (String) -> Void
    }
}
