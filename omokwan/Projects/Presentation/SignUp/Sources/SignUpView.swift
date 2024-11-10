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
    @FocusState private var focusedField: SignUpTextFieldType?
    
    private enum SignUpTextFieldType {
        case nickname
    }
    
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
                leadingIcon: OImages.icArrowLeft.swiftUIImage,
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
                color: OColors.text01.swiftUIColor
            )
            .greedyWidth(.leading)
            .padding(.bottom, 16)
            OText(
                "2~10글자 사이의 한글, 영문, 숫자로 입력해주세요.",
                token: .body_long_02,
                color: OColors.text02.swiftUIColor
            )
            .greedyWidth(.leading)
            .padding(.bottom, 24)
            OTextField<SignUpTextFieldType>(
                text: Binding(
                    get: { viewStore.state.nickname },
                    set: { newValue in
                        viewStore.send(.setNickname(newValue))
                    }
                ),
                focusedField: $focusedField,
                focusedFieldType: .nickname,
                placeholder: "ex.오목완",
                textMaxCount: 10
            )
        }
    }
}
