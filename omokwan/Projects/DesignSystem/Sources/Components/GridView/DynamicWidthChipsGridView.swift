//
//  DynamicWidthChipsGridView.swift
//  DesignSystem
//
//  Created by 김동준 on 1/30/25
//

import SwiftUI

public struct DynamicWidthChipsGridView: View {
    let categories: [ChipsGridModel]
    @State private var chipWidths: [String: CGFloat] = [:]
    private let spacingOfEachItems: CGFloat = 10
    
    public init(categories: [ChipsGridModel]) {
        self.categories = categories
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let containerWidth = floor(geometry.size.width)
            let twoDimensionsRow = arrangeChips(categories, containerWidth, spacingOfEachItems)
            
            VStack(alignment: .leading, spacing: 12) {
                ForEach(twoDimensionsRow, id: \.self) { row in
                    HStack(spacing: spacingOfEachItems) {
                        ForEach(row, id: \.self) { category in
                            OEmojiChips(
                                imoji: category.emoji,
                                title: category.title,
                                isSelected: Binding(
                                    get: { false },
                                    set: { _ in }
                                )
                            )
                            .modifier(
                                DynamicWidthChipsModifier(chipWidths: $chipWidths, title: category.title)
                            )
                        }
                    }
                    .greedyWidth(.leading)
                }
            }
        }
    }
}

private extension DynamicWidthChipsGridView {
    func arrangeChips(_ categories: [ChipsGridModel], _ maxWidth: CGFloat, _ spacing: CGFloat) -> [[ChipsGridModel]] {
        var rows: [[ChipsGridModel]] = []
        var oneDimensionsRow: [ChipsGridModel] = []
        var totalSumOfOneDimensionRowWidth: CGFloat = 0
        
        for category in categories {
            let chipWidth: CGFloat = round(chipWidths[category.title] ?? 100)
            let sumOfRow: CGFloat = round(totalSumOfOneDimensionRowWidth + chipWidth)
            
            if sumOfRow > maxWidth {
                rows.append(oneDimensionsRow)
                oneDimensionsRow = []
                totalSumOfOneDimensionRowWidth = 0
            }
            
            oneDimensionsRow.append(category)
            totalSumOfOneDimensionRowWidth += chipWidth
            
            if !(sumOfRow + spacing > maxWidth) {
                totalSumOfOneDimensionRowWidth += spacing
            }
        }
        
        if !oneDimensionsRow.isEmpty {
            rows.append(oneDimensionsRow)
        }
        
        return rows
    }
}

public struct ChipsGridModel: Hashable {
    let title: String
    let emoji: String
    
    public init(title: String, emoji: String) {
        self.title = title
        self.emoji = emoji
    }
}
