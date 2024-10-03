//
//  SignUpCoordinator.swift
//  SignUp
//
//  Created by 김동준 on 10/4/24
//

extension SignUpView {
    public struct SignUpCoordinator {
        public init(
            navigateToMain: @escaping () -> Void
        ) {
            self.navigateToMain = navigateToMain
        }
        
        let navigateToMain: () -> Void
    }
}
