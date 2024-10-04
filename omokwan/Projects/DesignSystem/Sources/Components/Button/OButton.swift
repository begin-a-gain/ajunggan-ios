//
//  OButton.swift
//  DesignSystem
//
//  Created by 김동준 on 10/4/24
//

import SwiftUI

public struct OButton: View {
    let title: String
    let style: OButtonStyle
    let action: (() -> Void)?
    
    public init(
        title: String,
        style: OButtonStyle,
        action: (()-> Void)? = nil
    ) {
        self.title = title
        self.style = style
        self.action = action
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            Button {
                
            } label: {
                OText(
                    title,
                    token: .title_02,
                    color: textColor
                )
                .vPadding(12)
                .greedyWidth()
            }
        }
        .background(backgroundColor)
//        .overlay(RoundedRectangle(cornerRadius: 8).stroke(borderColor, lineWidth: 1.0)) // TODO: 컬러 나오면 바꿀 것.
        .cornerRadius(8)
    }
    
    private var textColor: Color {
        switch style {
        case .disabled: .gray // TODO: 컬러 나오면 작업
        case .primary: .white // TODO: 컬러 나오면 작업
        case .alert: .white // TODO: 컬러 나오면 작업
        }
    }
    
    private var backgroundColor: Color {
        switch style {
        case .disabled: .black // TODO: 컬러 나오면 작업
        case .primary: .orange // TODO: 컬러 나오면 작업
        case .alert: .red // TODO: 컬러 나오면 작업
        }
    }
}

public enum OButtonStyle {
    case disabled
    case primary
    case alert
}
