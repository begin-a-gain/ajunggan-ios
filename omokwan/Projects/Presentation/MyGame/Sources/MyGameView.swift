//
//  MyGameView.swift
//  MyGame
//
//  Created by 김동준 on 11/23/24
//

import SwiftUI
import ComposableArchitecture
import DesignSystem

public struct MyGameView: View {
    let store: StoreOf<MyGameFeature>
    @ObservedObject var viewStore: ViewStoreOf<MyGameFeature>

    public init(store: StoreOf<MyGameFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        ScrollView {
            ForEach(0..<40) { _ in
                Text("My Game View").greedyWidth()
            }
            
            Button {

            } label: {
                Text("Navigate To Depth View")
            }
        }
    }
}
