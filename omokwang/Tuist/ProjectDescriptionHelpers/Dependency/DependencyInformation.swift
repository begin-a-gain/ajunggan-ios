//
//  DependencyInformation.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 8/21/24
//

import Foundation

let dependencyInfo: [DependencyInformation: [DependencyInformation]] = [
    .App: [.SignIn],
    .Domain: [],
    .Data: [.Domain]
]

public enum DependencyInformation: String {
    case App = "App"
    case SignIn = "SignIn"
    case Domain = "Domain"
    case Data = "Data"
}

public enum PresentationDependencyInformation: String, CaseIterable {
    case App = "App"
    case SignIn = "SignIn"
}
