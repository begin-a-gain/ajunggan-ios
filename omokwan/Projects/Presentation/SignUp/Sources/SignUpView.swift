//
//  SignUpView.swift
//  SignUp
//
//  Created by 김동준 on 10/1/24
//

import SwiftUI
import DesignSystem
import ComposableArchitecture

public struct SignUpView: View {
    let store: StoreOf<SignUpFeature>
    @ObservedObject var viewStore: ViewStoreOf<SignUpFeature>

    public init(store: StoreOf<SignUpFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    @FocusState private var focusedField: SignUpTextFieldType?
    
    private enum SignUpTextFieldType {
        case nickname
    }
    
    public var body: some View {
        signUpBody
    }
    
    private var signUpBody: some View {
        VStack(spacing: 0) {
            ONavigationBar(
                leadingIcon: OImages.icArrowLeft.swiftUIImage,
                leadingIconAction: {
                    viewStore.send(.navigateToBack)
                }
            ).padding(.bottom, 34)
            nicknameSettingView.hPadding(20)
            Spacer()
            OButton(
                title: "다음",
                status: viewStore.state.isNextButtonEnable ? .default : .disable,
                type: .default,
                action: {
                    viewStore.send(.nextButtonTapped)
                }
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
