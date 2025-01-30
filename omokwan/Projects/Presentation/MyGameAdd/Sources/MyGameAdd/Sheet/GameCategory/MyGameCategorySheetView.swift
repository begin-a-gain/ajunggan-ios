//
//  MyGameCategorySheetView.swift
//  MyGameAdd
//
//  Created by 김동준 on 12/7/24
//

import ComposableArchitecture
import SwiftUI
import DesignSystem

struct MyGameCategorySheetView: View {
    let store: StoreOf<MyGameCategorySheetFeature>
    @ObservedObject var viewStore: ViewStoreOf<MyGameCategorySheetFeature>
    
    init(store: StoreOf<MyGameCategorySheetFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    var body: some View {
        OSheetView(
            title: "대국 카테고리",
            sheetContent: sheetContent,
            buttonStatus: viewStore.selectedCategory == nil ? .disable : .default,
            buttonAction: {
                if let category = viewStore.selectedCategory {
                    viewStore.send(.selectButtonTapped(category))
                }
            }
        )
    }
    private var sheetContent: some View {
        VStack(spacing: 0) {
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 4)
            ) {
                ForEach(Array(zip(viewStore.categories.indices, viewStore.categories)), id: \.1) { index, category in
                    OEmojiChips(
                        imoji: category.emoji,
                        title: category.rawValue,
                        isSelected: Binding(
                            get: { viewStore.selectedCategory == category },
                            set: { newValue in viewStore.send(.categoryTapped(category)) }
                        )
                    )
                }.greedyWidth(.leading)
            }
        }
        .vPadding(14)
        .hPadding(20)
    }
}
