//
//  DependencyInformation.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 8/21/24
//

import Foundation

let dependencyInfo: [DependencyInformation: [DependencyInformation]] = [
    .App: [.Root, .DI, .Data, .KakaoSDKUser],
    .Domain: [.DI],
    .Data: [.Domain, .KakaoSDKUser],
    .Root: [.SignIn, .Main],
    .SignIn: [.Domain, .Base],
    .Main: [],
    .DI: [.Swinject],
    .Base: [.DesignSystem]
]

public enum DependencyInformation: String {
    case App = "App"
    case SignIn = "SignIn"
    case Domain = "Domain"
    case Data = "Data"
    case Root = "Root"
    case Main = "Main"
    case DI = "DI"
    case Swinject = "Swinject"
    case Base = "Base"
    case KakaoSDKUser = "KakaoSDKUser"
    case DesignSystem = "DesignSystem"
}

public enum PresentationDependencyInformation: String, CaseIterable {
    case SignIn = "SignIn"
    case Root = "Root"
    case Main = "Main"
    case Base = "Base"
}
