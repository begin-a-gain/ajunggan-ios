//
//  OTextField.swift
//  DesignSystem
//
//  Created by 김동준 on 10/4/24
//

import SwiftUI

public struct OTextFeild: View {
    let label: String?
    let isLabel: Bool
    let placeholder: String
    let text: Binding<String>
    let keyboardType: UIKeyboardType
    let errorMessage: String?
    let textMaxCount: Int
    let isSecureField: Bool
    let isDisabled: Bool
    let leadingIcon: Image?
    let leadingIconButtonAction: (() -> Void)?
    let trailingIcon: Image?
    let trailingIconButtonAction: (() -> Void)?
    
    public init(
        label: String? = nil,
        isLabel: Bool = true,
        placeholder: String,
        text: Binding<String>,
        keyboardType: UIKeyboardType = .default,
        errorMessage: String? = nil,
        textMaxCount: Int = 10,
        isSecureField: Bool = false,
        isDisabled: Bool = false,
        leadingIcon: Image? = nil,
        leadingIconButtonAction: (() -> Void)? = nil,
        trailingIcon: Image? = nil,
        trailingIconButtonAction: (() -> Void)? = nil
    ) {
        self.label = label
        self.isLabel = isLabel
        self.placeholder = placeholder
        self.text = text
        self.keyboardType = keyboardType
        self.errorMessage = errorMessage
        self.textMaxCount = textMaxCount
        self.isSecureField = isSecureField
        self.isDisabled = isDisabled
        self.leadingIcon = leadingIcon
        self.leadingIconButtonAction = leadingIconButtonAction
        self.trailingIcon = trailingIcon
        self.trailingIconButtonAction = trailingIconButtonAction
    }
    
    public var body: some View {
        VStack(spacing: 4) {
            if isLabel {
                if let label = label {
                    labelView(label)
                }
            }
            
            HStack(spacing: 12) {
                if let leadingIcon = leadingIcon {
                    leadingIconView(image: leadingIcon)
                }
                if isSecureField {
                    secureFieldView
                } else {
                    normalTextFieldView
                }
                if let trailingIcon = trailingIcon {
                    trailingIconView(image: trailingIcon)
                }
            }
            .greedyWidth()
            .padding(16)
            .background(isDisabled ? .gray : .clear)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(borderColor, lineWidth: 1.0)) // TODO: 컬러 나오면 바꿀 것.
            .cornerRadius(8)
            
            VStack(spacing: 0) {
                Spacer().height(4)
                HStack(alignment: .top, spacing: 10) {
                    if let errorMessage = errorMessage {
                        errorMessageView(errorMessage)
                    }
                    Spacer()
                    textCountView
                }
                .greedyWidth()
                .hPadding(16)
            }
        }
    }
    
    private var borderColor: Color {
        if let errorMessage = errorMessage {
            if errorMessage.isEmpty {
                Color.gray // TODO: 컬러 나오면 변경
            } else {
                Color.red // TODO: 컬러 나오면 변경
            }
        } else {
            Color.gray // TODO: 컬러 나오면 변경
        }
    }
    
    private func labelView(_ label: String) -> some View {
        HStack(spacing: 0) {
            OText(
                label,
                token: .subtitle_02,
                color: .black // TODO: 컬러 나오면 바꿀 것.
            ).greedyWidth(.leading)
        }.hPadding(16)
    }
    
    private func leadingIconView(image: Image) -> some View {
        image.resizedToFit(20, 20) // TODO: 적절한 이미지가 나오면 교체
    }
    
    private func trailingIconView(image: Image) -> some View {
        Button {
            if let action = trailingIconButtonAction {
                action()
            }
        } label: {
            image.resizedToFit(20, 20) // TODO: 적절한 이미지가 나오면 교체
        }
    }
    
    private var normalTextFieldView: some View {
        TextField(
            "",
            text: text,
            prompt: Text(
                placeholder
            )
            .font(.suit(token: .body_02))
            .foregroundColor(.gray) // TODO: 컬러 나오면 바꿀 것.
        )
        .keyboardType(keyboardType)
        .font(.suit(token: .body_02))
        .foregroundStyle(.black) // TODO: 컬러 나오면 바꿀 것.
        .greedyWidth(.leading)
        .disabled(isDisabled)
    }
    
    private var secureFieldView: some View {
        SecureField(
            "",
            text: text,
            prompt: Text(
                placeholder
            )
            .font(.suit(token: .body_02))
            .foregroundColor(.gray) // TODO: 컬러 나오면 바꿀 것.
        )
        .keyboardType(keyboardType)
        .font(.suit(token: .body_02))
        .foregroundStyle(.black) // TODO: 컬러 나오면 바꿀 것.
        .greedyWidth(.leading)
        .disabled(isDisabled)
    }
    
    private func errorMessageView(_ errorMessage: String) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            OText(
                errorMessage,
                token: .caption,
                color: .red, // TODO: 컬러 나오면 바꿀 것.
                alignment: .leading,
                lineLimit: 2
            )
        }
    }
    
    private var textCountView: some View {
        HStack(alignment: .bottom, spacing: 4) {
            OText(
                "\(text.wrappedValue.count)",
                token: .caption,
                color: textCountColor // TODO: 컬러 나오면 바꿀 것.
            )
            OText(
                "/",
                token: .caption,
                color: textCountColor // TODO: 컬러 나오면 바꿀 것.
            )
            OText(
                "\(textMaxCount)",
                token: .caption,
                color: textCountColor // TODO: 컬러 나오면 바꿀 것.
            )
        }
    }
    
    private var textCountColor: Color {
        if text.wrappedValue.count > textMaxCount {
            Color.red // TODO: 컬러 나오면 바꿀 것.
        } else {
            Color.gray // TODO: 컬러 나오면 바꿀 것.
        }
    }
}
