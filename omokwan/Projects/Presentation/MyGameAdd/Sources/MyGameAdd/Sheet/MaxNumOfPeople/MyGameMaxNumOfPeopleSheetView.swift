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
        OSheetView(
            title: "최대 인원 수",
            sheetContent: sheetContent,
            buttonAction: {
                viewStore.send(.selectButtonTapped(viewStore.selectedMaxNumOfPeopleCount))
            }
        )
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
}
