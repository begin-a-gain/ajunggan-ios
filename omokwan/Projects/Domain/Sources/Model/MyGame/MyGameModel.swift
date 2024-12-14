//
//  MyGameModel.swift
//  Domain
//
//  Created by 김동준 on 12/14/24
//

// TODO: 임시 모델
public struct MyGameModel: Equatable {
    public let myGameCompleteStatus: MyGameCompleteStatus
    
    public init(myGameCompleteStatus: MyGameCompleteStatus) {
        self.myGameCompleteStatus = myGameCompleteStatus
    }
}
