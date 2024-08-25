//
//  SignInView.swift
//  SignIn
//
//  Created by 김동준 on 8/25/24
//

import SwiftUI

public struct SignInView: View {
    var coordinator: SignInCoordinator
    @StateObject var signInViewModel: SignInViewModel
    
    public init(coordinator: SignInCoordinator, signInViewModel: SignInViewModel) {
        self.coordinator = coordinator
        self._signInViewModel = StateObject(wrappedValue: signInViewModel)
    }
    
    public var body: some View {
        VStack {
            Text("This is Sign In View")
            Button {
                coordinator.navigateToMain("카카오 로그인 성공")
            } label: {
                Text("카카오 로그인")
                .frame(width: 200, height: 100).background(.green)
            }
        }
    }
}
