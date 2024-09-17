//
//  BaseUrl.swift
//  Data
//
//  Created by 김동준 on 9/15/24
//

public enum BaseUrl: String {
    case DEBUG = "debug"
    case RELEASE = "release"
    
    public static let environment: BaseUrl = {
        #if Debug
        return .DEBUG
        #else
        return .RELEASE
        #endif
    }()
}
