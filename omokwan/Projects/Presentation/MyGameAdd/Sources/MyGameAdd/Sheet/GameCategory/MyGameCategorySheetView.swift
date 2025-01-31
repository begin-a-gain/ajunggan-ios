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
        DynamicWidthChipsGridView(
            categories: viewStore.categories.map {
                ChipsGridModel(title: $0.rawValue, emoji: $0.emoji)
            },
            selectedTitle: viewStore.selectedCategory?.rawValue,
            tapAction: { categoryTitle in
                viewStore.send(.categoryTapped(categoryTitle))
            }
        )
        .vPadding(14)
        .hPadding(20)
    }
}
