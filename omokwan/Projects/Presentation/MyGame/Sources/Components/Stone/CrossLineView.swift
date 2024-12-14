//
//  CrossLineView.swift
//  MyGame
//
//  Created by 김동준 on 12/7/24
//

import SwiftUI
import DesignSystem

struct CrossLineView: View {
    let crossLineSize: CGFloat
    let circleSize: CGFloat
    let hasData: Bool
    
    init(
        crossLineSize: CGFloat,
        circleSize: CGFloat,
        hasData: Bool
    ) {
        self.crossLineSize = crossLineSize
        self.circleSize = circleSize
        self.hasData = hasData
    }
    
    var body: some View {
        CrossLinePathView()
            .stroke(OColors.strokePrimary.swiftUIColor.opacity(0.4), lineWidth: 2)
            .frame(width: crossLineSize, height: crossLineSize)
            .modifier(
                CrossLineModifier(
                    hasData: hasData,
                    circleSize: circleSize
                )
            )
    }
}

private struct CrossLinePathView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // .horizontal
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        // .vertical
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        return path
    }
}
