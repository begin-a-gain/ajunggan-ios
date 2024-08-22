//
//  DependencyInformation.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 8/21/24
//

import Foundation

let dependencyInfo: [DependencyInformation: [DependencyInformation]] = [
    .App: [.SignIn]
]

public enum DependencyInformation: String {
    case App = "App"
    case SignIn = "SignIn"
}

public enum PresentationDependencyInformation: String, CaseIterable {
    case App = "App"
    case SignIn = "SignIn"
}
