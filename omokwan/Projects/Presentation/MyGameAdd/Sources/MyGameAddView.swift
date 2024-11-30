//
//  MyGameAddView.swift
//  MyGameAdd
//
//  Created by 김동준 on 11/30/24
//

import ComposableArchitecture
import SwiftUI

public struct MyGameAddView: View {
    let store: StoreOf<MyGameAddFeature>
    @ObservedObject var viewStore: ViewStoreOf<MyGameAddFeature>

    public init(store: StoreOf<MyGameAddFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        VStack {
            
        }
    }
}
