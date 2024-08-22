//
//  App.swift
//  App
//
//  Created by 김동준 on 8/21/24
//

import SwiftUI

@main
struct RootApp: App {
    @UIApplicationDelegateAdaptor var delegate: AppDelegate

    init() {}
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                Text("Hello World")
            }
        }
    }
}
