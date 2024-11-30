//
//  AddGameSheetView.swift
//  Main
//
//  Created by 김동준 on 11/24/24
//

import SwiftUI
import ComposableArchitecture
import DesignSystem

struct AddGameSheetView: View {
    private let store: StoreOf<AddGameSheetFeature>
    @ObservedObject private var viewStore: ViewStoreOf<AddGameSheetFeature>
    
    public init(store: StoreOf<AddGameSheetFeature>) {
        self.store = store
        viewStore = ViewStore(store) { $0 }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
            bodyView
            bottomView
        }
    }
    
    private var headerView: some View {
        OText(
            "대국 추가하기",
            token: .title_02
        ).vPadding(8)
    }
    
    private var bottomView: some View {
        OButton(
            title: "확인",
            status: viewStore.selectedGameType == nil ? .disable : .default,
            type: .default,
            action: {
                viewStore.send(.addGameSheetButtonTapped)
            }
        )
        .vPadding(16)
        .hPadding(20)
    }
}

// MARK: Body
private extension AddGameSheetView {
    private var bodyView: some View {
        HStack(spacing: 16) {
            ForEach(AddGameSheetFeature.State.AddGameType.allCases, id: \.self) { item in
                addGameCardView(type: item)
            }
        }
        .hPadding(20)
    }
    
    private func addGameCardView(type: AddGameSheetFeature.State.AddGameType) -> some View {
        Button {
            viewStore.send(.selectType(type))
        } label: {
            VStack(spacing: 16) {
                // TODO: Change Image Later
                Rectangle()
                    .fill(.gray)
                    .frame(width: 121, height: 147)
                OText(
                    getGameCardTitle(type: type),
                    token: .title_02,
                    color: viewStore.selectedGameType == type ? OColors.text01.swiftUIColor : OColors.text02.swiftUIColor
                ).vPadding(8)
            }
            .padding(24)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        viewStore.selectedGameType == type ? OColors.strokePrimary.swiftUIColor : OColors.stroke02.swiftUIColor,
                        lineWidth: 1.0
                    )
            )
        }
    }
    
    private func getGameCardTitle(type: AddGameSheetFeature.State.AddGameType) -> String {
        switch type {
        case .add:
            return "대국 만들기"
        case .participate:
            return "대국 참여하기"
        }
    }
}
