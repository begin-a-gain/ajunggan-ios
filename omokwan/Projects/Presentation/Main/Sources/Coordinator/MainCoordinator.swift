//
//  MainCoordinator.swift
//  Main
//
//  Created by 김동준 on 10/1/24
//

import Base
import SwiftUI

final public class MainCoordinator: BaseCoordinator<MainScreen> {
    @ViewBuilder
    func view(_ screen: MainScreen) -> some View {
        switch screen {
        case .main:
            mainView(.main)
        case .depth:
            mainView(.depth)
        }
    }
}

// MARK: About Main
extension MainCoordinator {
    private func mainView(_ screen: MainScreen) -> some View {
        switch screen {
        case .main:
            return AnyView(
                MainView(
                    coordinator: self,
                    viewStore: MainStore()
                )
            )
        case .depth:
            return AnyView(DepthView())
        }
    }
}
