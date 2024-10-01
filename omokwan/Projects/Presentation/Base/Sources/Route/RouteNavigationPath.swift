//
//  RouteNavigationPath.swift
//  Base
//
//  Created by 김동준 on 10/1/24
//

import SwiftUI

public class RouteNavigationPath<Screen>: ObservableObject {
    @Published public var path: NavigationPath
    @Published public var screen: Screen
    
    public init(path: NavigationPath, screen: Screen) {
        self.path = path
        self.screen = screen
    }
}
