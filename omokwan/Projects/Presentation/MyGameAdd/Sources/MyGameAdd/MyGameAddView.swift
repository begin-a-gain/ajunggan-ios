//
//  MyGameAddView.swift
//  MyGameAdd
//
//  Created by 김동준 on 11/30/24
//

import ComposableArchitecture
import SwiftUI
import DesignSystem

public struct MyGameAddView: View {
    let store: StoreOf<MyGameAddFeature>
    @ObservedObject var viewStore: ViewStoreOf<MyGameAddFeature>

    public init(store: StoreOf<MyGameAddFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        myGameAddBodyView
    }
    
    private var myGameAddBodyView: some View {
        VStack(spacing: 0) {
            ONavigationBar(
                leadingIcon: OImages.icArrowLeft.swiftUIImage,
                leadingIconAction: {
                    viewStore.send(.navigateToBack)
                }
            )
        }
    }
}
