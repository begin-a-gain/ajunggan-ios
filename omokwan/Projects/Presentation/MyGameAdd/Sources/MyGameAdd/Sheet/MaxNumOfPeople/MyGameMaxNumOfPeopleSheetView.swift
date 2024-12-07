//
//  MyGameMaxNumOfPeopleSheetView.swift
//  MyGameAdd
//
//  Created by 김동준 on 12/7/24
//

import ComposableArchitecture
import SwiftUI
import DesignSystem

struct MyGameMaxNumOfPeopleSheetView: View {
    let store: StoreOf<MyGameMaxNumOfPeopleSheetFeature>
    @ObservedObject var viewStore: ViewStoreOf<MyGameMaxNumOfPeopleSheetFeature>
    
    init(store: StoreOf<MyGameMaxNumOfPeopleSheetFeature>) {
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
            "최대 인원 수",
            token: .title_02
        ).vPadding(8)
    }
    
    private var sheetContent: some View {
        Picker("", selection: viewStore.$selectedMaxNumOfPeopleCount) {
            ForEach(viewStore.maxNumOfPeopleAllCases, id: \.self) {
                OText("\($0)")
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
                viewStore.send(.selectButtonTapped(viewStore.selectedMaxNumOfPeopleCount))
            }
        )
        .vPadding(16)
        .hPadding(20)
    }
}
