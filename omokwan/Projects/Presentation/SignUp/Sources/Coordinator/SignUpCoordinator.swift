//
//  SignUpCoordinator.swift
//  SignUp
//
//  Created by 김동준 on 10/4/24
//

extension SignUpView {
    public struct SignUpCoordinator {
        public init(
            navigateToSignUpDone: @escaping () -> Void,
            navigateToBack: @escaping () -> Void
        ) {
            self.navigateToSignUpDone = navigateToSignUpDone
            self.navigateToBack = navigateToBack
        }
        
        let navigateToSignUpDone: () -> Void
        let navigateToBack: () -> Void
    }
}
