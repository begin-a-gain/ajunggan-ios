//
//  OText.swift
//  DesignSystem
//
//  Created by 김동준 on 9/28/24
//

import SwiftUI

public struct OText: View {
    let text: String
    let token: Font.FontToken
    let color: Color
    let alignment: TextAlignment
    let lineLimit: Int?
    let letterSpace: CGFloat
    
    public init(
        _ text: String,
        token: Font.FontToken = .body_02,
        color: Color = .black,
        alignment: TextAlignment = .center,
        lineLimit: Int = 1,
        letterSpace: CGFloat = 0
    ) {
        self.text = text
        self.token = token
        self.color = color
        self.alignment = alignment
        self.lineLimit = lineLimit
        self.letterSpace = letterSpace
    }
    
    public var body: some View {
        Text(text)
            .font(.suit(token: token))
            .foregroundStyle(color)
            .multilineTextAlignment(alignment)
            .lineLimit(lineLimit)
            .kerning(letterSpace)
            .lineSpacing(getLineSpacing(token))
            .padding(.vertical, getLineSpacing(token)/2)
    }
    
    private func getLineSpacing(_ token: Font.FontToken) -> Double {
        switch token {
        case .display, .headline: return 8
        case .title_02, .title_01, .subtitle_03, .subtitle_02, .subtitle_01: return 4
            
        case .body_02, .body_01: return 4
        case .body_long_02, .body_long_01: return 8
        
        case .caption: return 4
        case .caption_long: return 8
        }
    }
}
