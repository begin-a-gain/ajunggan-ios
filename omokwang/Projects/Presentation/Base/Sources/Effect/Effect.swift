//
//  Effect.swift
//  Base
//
//  Created by 김동준 on 9/16/24
//

public enum Effect<Action> {
    case none
    case send(Action)
    case run(() async -> Action)
}
