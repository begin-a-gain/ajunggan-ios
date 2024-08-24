//
//  RootNavigationPath.swift
//  Root
//
//  Created by 김동준 on 8/24/24
//

import SwiftUI

final class RootNavigationPath: ObservableObject {
    @Published var path: NavigationPath
    
    init(path: NavigationPath) {
        self.path = path
    }
}
