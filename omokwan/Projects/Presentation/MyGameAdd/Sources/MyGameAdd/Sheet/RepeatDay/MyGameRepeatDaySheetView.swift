//
//  MyGameRepeatDaySheetView.swift
//  MyGameAdd
//
//  Created by 김동준 on 12/7/24
//

import ComposableArchitecture
import SwiftUI
import DesignSystem

struct MyGameRepeatDaySheetView: View {
    let store: StoreOf<MyGameRepeatDaySheetFeature>
    @ObservedObject var viewStore: ViewStoreOf<MyGameRepeatDaySheetFeature>
    
    init(store: StoreOf<MyGameRepeatDaySheetFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    var body: some View {
        VStack(spacing: 0) {
            sheetTitle
            sheetContent
            sheetButton
        }
    }
    
    private var sheetTitle: some View {
        OText(
            "반복 요일",
            token: .title_02
        ).vPadding(8)
    }
    
    private var sheetContent: some View {
        Picker("", selection: viewStore.$selectedRepeatDay) {
            ForEach(viewStore.repeatDayAllCases, id: \.self) {
                OText($0.rawValue)
            }
        }
        .pickerStyle(.wheel)
        .vPadding(14)
        .hPadding(20)
    }
    
    private var sheetButton: some View {
        OButton(
            title: "확인",
            status: .default,
            type: .default,
            action: {
                viewStore.send(.selectButtonTapped(viewStore.selectedRepeatDay))
            }
        )
        .vPadding(16)
        .hPadding(20)
    }
}
