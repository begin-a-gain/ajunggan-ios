//
//  BaseCoordinator.swift
//  Base
//
//  Created by 김동준 on 10/1/24
//

import SwiftUI

open class BaseCoordinator<Screen: Hashable>: ObservableObject {
    @Published public var navigationPath: NavigationPath = NavigationPath()
    @Published public var rootScreen: Screen

    public var id: UUID
    
    public init(rootScreen: Binding<Screen>) {
        self.rootScreen = rootScreen.wrappedValue
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
