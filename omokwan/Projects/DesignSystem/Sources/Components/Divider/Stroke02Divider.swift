//
//  Stroke02Divider.swift
//  DesignSystem
//
//  Created by 김동준 on 12/3/24
//

import SwiftUI

public struct Stroke02Divider: View {
    public init() {}
    
    public var body: some View {
        Spacer()
            .height(1)
            .greedyWidth()
            .background(OColors.stroke02.swiftUIColor)
    }
}
