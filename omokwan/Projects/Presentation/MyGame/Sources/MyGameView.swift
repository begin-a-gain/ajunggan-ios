//
//  MyGameView.swift
//  MyGame
//
//  Created by 김동준 on 11/23/24
//

import SwiftUI
import ComposableArchitecture
import DesignSystem

public struct MyGameView: View {
    let store: StoreOf<MyGameFeature>
    @ObservedObject var viewStore: ViewStoreOf<MyGameFeature>

    public init(store: StoreOf<MyGameFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        myGameViewBody
    }
    
    private var myGameViewBody: some View {
        ZStack(alignment: .bottom) {
            if !viewStore.isGameAddFloatingMessageVisible {
                gameAddFloatingMessageView
                    .zIndex(2)
            }
            VStack(spacing: 0) {
                ONavigationBar(
                    isMain: true,
                    trailingIcon: OImages.icBell.swiftUIImage,
                    trailingIconAction: {
                        // TODO: Impelment this action
                    }
                )
                ScrollView {
                    ForEach(0..<40) { _ in
                        Text("My Game View").greedyWidth()
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Navigate To Depth View")
                    }
                }
            }.zIndex(1)
        }
    }
    
    private var gameAddFloatingMessageView: some View {
        ZStack {
            OText(
                "대국을 생성해보세요!",
                token: .title_01,
                color: OColors.textOn01.swiftUIColor
            )
            .hPadding(28)
            .vPadding(12)
            .background(OColors.uiBackground2.swiftUIColor)
            .cornerRadius(8)
            .padding(.bottom, 60)
            .overlay {
                RoundedTriangle(cornerRadius: 4)
                    .rotation(.degrees(180))
                    .fill(OColors.uiBackground2.swiftUIColor)
                    .overlay {
                        RoundedTriangle(cornerRadius: 4)
                            .rotation(.degrees(180))
                            .stroke(OColors.uiBackground2.swiftUIColor, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    }
                    .frame(30, 30)
                    .padding(.bottom, 14)
            }
        }
    }
}
