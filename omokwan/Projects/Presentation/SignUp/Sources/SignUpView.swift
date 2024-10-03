//
//  SignUpView.swift
//  SignUp
//
//  Created by 김동준 on 10/1/24
//

import SwiftUI

public struct SignUpView: View {
    var coordinator: SignUpCoordinator
    
    public init(coordinator: SignUpCoordinator) {
        self.coordinator = coordinator
    }
    
    public var body: some View {
        VStack {
            Text("SignUp")
            Button {
                coordinator.navigateToMain()
            } label: {
                Text("Go To Main")
            }
        }
    }
}
