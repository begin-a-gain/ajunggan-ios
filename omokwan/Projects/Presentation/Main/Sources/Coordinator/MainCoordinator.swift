//
//  MainCoordinator.swift
//  Main
//
//  Created by 김동준 on 10/1/24
//

extension MainView {
    public struct MainCoordinator {
        let navigateToRoot: () -> Void
        let navigateToDepth: () -> Void

        public init(
            navigateToRoot: @escaping () -> Void,
            navigateToDepth: @escaping () -> Void
        ) {
            self.navigateToRoot = navigateToRoot
            self.navigateToDepth = navigateToDepth
        }
    }
}
