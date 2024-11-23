//
//  AddGameSheetView.swift
//  Main
//
//  Created by 김동준 on 11/24/24
//

import SwiftUI
import ComposableArchitecture

struct AddGameSheetView: View {
    private let store: StoreOf<AddGameSheetFeature>
    @ObservedObject private var viewStore: ViewStoreOf<AddGameSheetFeature>
    
    public init(store: StoreOf<AddGameSheetFeature>) {
        self.store = store
        viewStore = ViewStore(store) { $0 }
    }
    
    var body: some View {
        VStack {
            Text("Add Game Sheet")
        }
    }
}
