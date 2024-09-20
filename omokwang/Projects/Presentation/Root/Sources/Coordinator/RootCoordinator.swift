//
//  RootCoordinator.swift
//  Root
//
//  Created by 김동준 on 8/24/24
//

import SwiftUI
import Domain
import DI

final class RootCoordinator: Hashable {
    @Binding var navigationPath: NavigationPath
    let accountUseCaseProtocol: AccountUseCaseProtocol = DIContainer.shared.resolve()
    let socialUseCaseProtocol: SocialUseCaseProtocol = DIContainer.shared.resolve()

    private var id: UUID
    var screen: RootScreen
    
    init(navigationPath: Binding<NavigationPath>, screen: RootScreen) {
        self._navigationPath = navigationPath
        self.id = UUID()
        self.screen = screen
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: RootCoordinator, rhs: RootCoordinator) -> Bool {
        lhs.id == rhs.id
    }
    
    func push<V>(_ value: V) where V : Hashable {
        navigationPath.append(value)
    }
    
    func pop() {
        navigationPath.removeLast()
    }
}
