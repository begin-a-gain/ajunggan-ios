//
//  DependencyInformation.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 8/21/24
//

import Foundation

let dependencyInfo: [DependencyInformation: [DependencyInformation]] = [
    .App: [.Root],
    .Domain: [],
    .Data: [.Domain],
    .Root: [.SignIn, .Main],
    .SignIn: [],
    .Main: []
]

public enum DependencyInformation: String {
    case App = "App"
    case SignIn = "SignIn"
    case Domain = "Domain"
    case Data = "Data"
    case Root = "Root"
    case Main = "Main"
}

public enum PresentationDependencyInformation: String, CaseIterable {
    case SignIn = "SignIn"
    case Root = "Root"
    case Main = "Main"
}
