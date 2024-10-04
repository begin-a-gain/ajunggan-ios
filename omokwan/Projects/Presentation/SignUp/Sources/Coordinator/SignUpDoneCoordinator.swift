//
//  SignUpDoneCoordinator.swift
//  SignUp
//
//  Created by 김동준 on 10/4/24
//

extension SignUpDoneView {
    public struct SignUpDoneCoordinator {
        public init(
            navigateToMain: @escaping () -> Void
        ) {
            self.navigateToMain = navigateToMain
        }
        
        let navigateToMain: () -> Void
    }
}
