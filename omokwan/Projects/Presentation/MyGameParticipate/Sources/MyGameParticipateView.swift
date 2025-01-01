//
//  MyGameParticipateView.swift
//  MyGameParticipate
//
//  Created by 김동준 on 1/1/25
//

import SwiftUI
import DesignSystem
import ComposableArchitecture

public struct MyGameParticipateView: View {
    let store: StoreOf<MyGameParticipateFeature>
    @ObservedObject var viewStore: ViewStoreOf<MyGameParticipateFeature>

    public init(store: StoreOf<MyGameParticipateFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        myGameParticipateBody
    }
    
    private var myGameParticipateBody: some View {
        VStack(spacing: 0) {
            ONavigationBar(
                title: "대국 참여하기",
                leadingIcon: OImages.icArrowLeft.swiftUIImage,
                leadingIconAction: {
                    viewStore.send(.navigateToBack)
                }
            )
            Spacer()
        }
    }
}
