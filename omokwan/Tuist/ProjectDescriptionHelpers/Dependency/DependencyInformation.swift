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
    .Root: [.SignIn, .SignUp, .Main],
    .SignIn: [.Domain, .Base],
    .SignUp: [.Domain, .Base],
    .Main: [.MyGame],
    .DI: [.Swinject],
    .Base: [.DesignSystem, .ComposableArchitecture],
    .MyGame: [.Base, .Util]
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
    case MyGame = "MyGame"
    case Util = "Util"
}

public enum PresentationDependencyInformation: String, CaseIterable {
    case SignIn = "SignIn"
    case SignUp = "SignUp"
    case Root = "Root"
    case Main = "Main"
    case Base = "Base"
    case MyGame = "MyGame"
}

public enum UtilsDependencyInformation: String, CaseIterable {
    case Util = "Util"
}
