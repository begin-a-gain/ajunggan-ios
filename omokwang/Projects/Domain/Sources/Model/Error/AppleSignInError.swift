//
//  AppleSignInError.swift
//  Domain
//
//  Created by 김동준 on 9/20/24
//

public enum AppleSignInError: Error {
    case invalidToken
    case unKnownError(Error)
}
