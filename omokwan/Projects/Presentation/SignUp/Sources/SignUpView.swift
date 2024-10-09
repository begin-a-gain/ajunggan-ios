//
//  SignUpView.swift
//  SignUp
//
//  Created by 김동준 on 10/1/24
//

import SwiftUI
import DesignSystem

public struct SignUpView: View {
    var coordinator: SignUpCoordinator
    @ObservedObject var viewStore: SignUpStore
    
    public init(coordinator: SignUpCoordinator, viewStore: SignUpStore) {
        self.coordinator = coordinator
        self.viewStore = viewStore
    }
    
    public var body: some View {
        signUpBody
    }
    
    private var signUpBody: some View {
        VStack(spacing: 0) {
            ONavigationBar(
                leadingIcon: OImage.icArrowLeft.swiftUIImage,
                leadingIconAction: { coordinator.navigateToBack() }
            ).padding(.bottom, 34)
            nicknameSettingView.hPadding(20)
            Spacer()
            OButton(
                title: "다음",
                style: viewStore.state.isNextButtonEnable ? .primary : .disabled,
                action: { coordinator.navigateToSignUpDone() }
            ).padding(20)
        }
    }
    
    private var nicknameSettingView: some View {
        VStack(spacing: 0) {
            OText(
                "닉네임을 설정해주세요.",
                token: .display,
                color: .black // TODO: 컬러 변경
            )
            .greedyWidth(.leading)
            .padding(.bottom, 16)
            OText(
                "2~10글자 사이의 한글, 영문, 숫자로 입력해주세요.",
                token: .body_long_02,
                color: .gray // TODO: 컬러 변경
            )
            .greedyWidth(.leading)
            .padding(.bottom, 24)
            OTextFeild(
                placeholder: "ex.오목완",
                text: Binding(
                    get: {
                        viewStore.state.nickname
                    },
                    set: { newValue in
                        viewStore.send(.setNickname(newValue))
                    }
                ),
                textMaxCount: 20
            )
        }
    }
}
