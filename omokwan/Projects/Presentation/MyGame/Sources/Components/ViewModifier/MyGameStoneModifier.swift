//
//  MyGameStoneModifier.swift
//  MyGame
//
//  Created by 김동준 on 12/7/24
//

import SwiftUI
import DesignSystem
import Domain

struct MyGameStoneModifier: ViewModifier {
    let myGameCompleteStatus: MyGameCompleteStatus
    
    init(myGameCompleteStatus: MyGameCompleteStatus) {
        self.myGameCompleteStatus = myGameCompleteStatus
    }
    
    func body(content: Content) -> some View {
        switch myGameCompleteStatus {
        case .complete:
            content
                .overlay {
                    Circle()
                        .stroke(OColors.strokePrimary.swiftUIColor.opacity(0.4), lineWidth: 1)
                }
        case .inComplete, .inCompleteWithSkip:
            content
        }
    }
}
