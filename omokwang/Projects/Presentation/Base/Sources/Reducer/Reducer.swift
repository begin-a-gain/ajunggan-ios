//
//  Reducer.swift
//  Base
//
//  Created by 김동준 on 9/16/24
//

import Foundation

open class Reducer<State, Action>: ObservableObject {
    @Published public var state: State
    
    public init(initialState: State) {
        self.state = initialState
    }
    
    @MainActor
    public func send(_ action: Action) {
        let effect = reduce(state: &state, action: action)
        guard case .none = effect else {
            handleEffect(effect)
            return
        }
    }
    
    @MainActor
    private func handleEffect(_ effect: Effect<Action>) {
        switch effect {
        case .send(let action):
            send(action)
        case .run(let asyncAction):
            Task {
                let action = await asyncAction()
                // TODO: Remove this line
                // try await Task.sleep(nanoseconds: 2_000_000_000)
                send(action)
            }
        case .none:
            break
        }
    }
    
    open func reduce(state: inout State, action: Action) -> Effect<Action> {
        return .none
    }
}
