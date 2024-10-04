//
//  SignUpStore.swift
//  SignUp
//
//  Created by 김동준 on 10/4/24
//

import Base

public struct SignUpState {
    public init() {}
    
    var isNextButtonEnable: Bool = false
    var nickname: String = ""
}

public enum SignUpAction {
    case setNickname(String)
}

public class SignUpStore: Reducer<SignUpState, SignUpAction> {
    public init(
        
    ) {
        super.init(initialState: SignUpState())
    }
        
    public override func reduce(state: inout SignUpState, action: SignUpAction) -> Effect<SignUpAction> {
        switch action {
        case .setNickname(let name):
            state.nickname = name
            print("DONGJUN -> \(state.nickname)")
            if !state.nickname.isEmpty {
                state.isNextButtonEnable = true
            } else {
                state.isNextButtonEnable = false
            }
            return .none
        }
    }
}
