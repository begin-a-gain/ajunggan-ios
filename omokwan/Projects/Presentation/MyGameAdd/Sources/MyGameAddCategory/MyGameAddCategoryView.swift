//
//  MyGameAddCategoryView.swift
//  MyGameAdd
//
//  Created by 김동준 on 11/30/24
//

import ComposableArchitecture
import SwiftUI
import DesignSystem

public struct MyGameAddCategoryView: View {
    let store: StoreOf<MyGameAddCategoryFeature>
    @ObservedObject var viewStore: ViewStoreOf<MyGameAddCategoryFeature>

    public init(store: StoreOf<MyGameAddCategoryFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        myGameAddCategoryBodyView
    }
    
    private var myGameAddCategoryBodyView: some View {
        VStack(spacing: 0) {
            ONavigationBar(
                leadingIcon: OImages.icArrowLeft.swiftUIImage,
                leadingIconAction: {
                    viewStore.send(.navigateToBack)
                }
            )
            Spacer().height(32)
            categoryInfoView
            Spacer().height(32)
            categoriesChipsView
            Spacer()
            buttonView
        }
    }
    
    private var categoryInfoView: some View {
        VStack(spacing: 16) {
            OText(
                "어떤 대국인가요?",
                token: .display
            ).greedyWidth(.leading)
            OText(
                "원하는 카테고리가 없다면 건너뛸 수 있어요!",
                token: .body_long_02,
                color: OColors.text02.swiftUIColor
            ).greedyWidth(.leading)
        }.hPadding(20)
    }
    
    private var categoriesChipsView: some View {
        VStack(spacing: 0) {
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 4)
            ) {
                ForEach(Array(zip(viewStore.categories.indices, viewStore.categories)), id: \.1) { index, category in
                    OImojiChips(
                        imoji: category.imoji,
                        title: category.rawValue,
                        isSelected: Binding(
                            get: { viewStore.selectedCategory == category },
                            set: { newValue in viewStore.send(.categoryTapped(category)) }
                        )
                    )
                }.greedyWidth(.leading)
            }
            .hPadding(20)
        }
    }
    
    private var buttonView: some View {
        VStack(spacing: 16) {
            OButton(
                title: "건너뛰기",
                status: .default,
                type: .text,
                size: .small,
                action: {
                    viewStore.send(.skipButtonTapped)
                }
            )
            OButton(
                title: "다음",
                status: viewStore.isNextButtonEnable ? .default : .disable,
                type: .default,
                action: {
                    viewStore.send(.nextButtonTapped(viewStore.selectedCategory))
                }
            )
        }
        .padding(.bottom, 16)
        .hPadding(20)
    }
}
