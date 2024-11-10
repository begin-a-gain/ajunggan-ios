//
//  SignUpDoneView.swift
//  SignUp
//
//  Created by 김동준 on 10/4/24
//

import SwiftUI
import DesignSystem

public struct SignUpDoneView: View {
    let coordinator: SignUpDoneCoordinator
    
    public init(coordinator: SignUpDoneCoordinator) {
        self.coordinator = coordinator
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            Spacer().height(164)
            Rectangle()
                .background(.gray)
                .greedyWidth()
                .hPadding(38)
                .height(394)
            Spacer()
            OButton(
                title: "오목완 시작하기",
                status: .default,
                type: .default,
                action: {
                    coordinator.navigateToMain()
                }
            ).padding(20)
        }.navigationBarBackButtonHidden(true)
    }
}
