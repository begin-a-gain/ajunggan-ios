//
//  SignInView.swift
//  SignIn
//
//  Created by 김동준 on 8/25/24
//

import SwiftUI

public struct SignInView: View {
    var coordinator: SignInCoordinator
    @StateObject var viewStore: SignInStore
    
    public init(coordinator: SignInCoordinator, viewStore: SignInStore) {
        self.coordinator = coordinator
        self._viewStore = StateObject(wrappedValue: viewStore)
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
            Button {
                viewStore.send(.signInButtonTapped)
            } label: {
                Text("API 통신 테스트 = \(viewStore.state.signInResult)")
                .frame(width: 200, height: 100).background(.green)
            }
            Text("[\(viewStore.state.count)]")
        }
    }
}
