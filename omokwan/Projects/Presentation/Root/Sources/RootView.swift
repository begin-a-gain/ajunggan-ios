//
//  RootView.swift
//  Root
//
//  Created by 김동준 on 11/20/24
//

import SwiftUI
import ComposableArchitecture
import SignIn

struct RootView: View {
    var body: some View {
        Text("This is Splash View")
        NavigationLink(state: RootCoordinatorFeature.RootPath.State.signIn(SignInFeature.State())) {
            Text("Navigate To Main")
                .foregroundStyle(.white)
                .padding()
                .background(.black)
        }
    }
}
