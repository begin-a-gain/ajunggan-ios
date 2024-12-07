//
//  OSheetView.swift
//  DesignSystem
//
//  Created by 김동준 on 12/7/24
//

import SwiftUI

public struct OSheetView<Content: View>: View {
    let title: String
    let sheetContent: Content
    let buttonAction: () -> Void
    
    public init(
        title: String,
        sheetContent: Content,
        buttonAction: @escaping () -> Void
    ) {
        self.title = title
        self.sheetContent = sheetContent
        self.buttonAction = buttonAction
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            sheetTitle
            sheetContent
            sheetButton
        }
    }
    
    private var sheetTitle: some View {
        OText(
            title,
            token: .title_02
        ).vPadding(8)
    }
    
    private var sheetButton: some View {
        OButton(
            title: "확인",
            status: .default,
            type: .default,
            action: {
                buttonAction()
            }
        )
        .vPadding(16)
        .hPadding(20)
    }
}
