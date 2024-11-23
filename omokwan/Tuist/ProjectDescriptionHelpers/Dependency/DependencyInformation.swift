//
//  DependencyInformation.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 8/21/24
//

import Foundation

let dependencyInfo: [DependencyInformation: [DependencyInformation]] = [
    .App: [.Root, .DI, .Data, .KakaoSDKUser, .ComposableArchitecture],
    .Domain: [.DI],
    .Data: [.Domain, .KakaoSDKUser],
    .Root: [.SignIn, .SignUp, .Main, .Base, .ComposableArchitecture],
    .SignIn: [.Domain, .Base, .ComposableArchitecture],
    .SignUp: [.Domain, .Base, .ComposableArchitecture],
    .Main: [.Base, .ComposableArchitecture],
    .DI: [.Swinject],
    .Base: [.DesignSystem, .ComposableArchitecture]
]

public enum DependencyInformation: String {
    case App = "App"
    case SignIn = "SignIn"
    case SignUp = "SignUp"
    case Domain = "Domain"
    case Data = "Data"
    case Root = "Root"
    case Main = "Main"
    case DI = "DI"
    case Swinject = "Swinject"
    case Base = "Base"
    case KakaoSDKUser = "KakaoSDKUser"
    case DesignSystem = "DesignSystem"
    case ComposableArchitecture = "ComposableArchitecture"
}

public enum PresentationDependencyInformation: String, CaseIterable {
    case SignIn = "SignIn"
    case SignUp = "SignUp"
    case Root = "Root"
    case Main = "Main"
    case Base = "Base"
}
