//
//  DependencyInformation.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 8/21/24
//

import Foundation

let dependencyInfo: [DependencyInformation: [DependencyInformation]] = [
    .App: [.Root, .DI],
    .Domain: [],
    .Data: [.Domain],
    .Root: [.SignIn, .Main],
    .SignIn: [],
    .Main: [],
    .DI: [.Swinject]
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
}

public enum PresentationDependencyInformation: String, CaseIterable {
    case SignIn = "SignIn"
    case Root = "Root"
    case Main = "Main"
}
