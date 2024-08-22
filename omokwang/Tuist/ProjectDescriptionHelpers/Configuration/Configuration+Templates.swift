//
//  Configuration+Templates.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 8/21/24
//

import ProjectDescription

public extension Configuration {
    static let defaultSettings: [Configuration] = [
        .debug(name: .debug, xcconfig: .relativeToRoot("XCConfig/Debug.xcconfig")),
        .release(name: .release, xcconfig: .relativeToRoot("XCConfig/Release.xcconfig"))
    ]
}
