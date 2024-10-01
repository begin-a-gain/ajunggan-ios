//
//  BaseCoordinator.swift
//  Base
//
//  Created by 김동준 on 10/1/24
//

import SwiftUI

open class BaseCoordinator<Screen: Hashable>: Hashable {
    @Binding public var navigationPath: NavigationPath
    @Binding public var screen: Screen

    public var id: UUID
    
    public init(navigationPath: Binding<NavigationPath>, screen: Binding<Screen>) {
        self._navigationPath = navigationPath
        self._screen = screen
        self.id = UUID()
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static public func == (lhs: BaseCoordinator<Screen>, rhs: BaseCoordinator<Screen>) -> Bool {
        lhs.id == rhs.id
    }
    
    public func push<V>(_ value: V) where V : Hashable {
        navigationPath.append(value)
    }
    
    public func pop() {
        navigationPath.removeLast()
    }
    
    public func root() {
        navigationPath = .init()
    }
}
