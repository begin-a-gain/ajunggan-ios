//
//  Date+Extension.swift
//  Util
//
//  Created by 김동준 on 11/30/24
//

import Foundation

extension Date {
    public func formattedString(format: String = DateFormatConstants.defaultFormat) -> String {
        let dateFormmatter = DateFormatter()
        dateFormmatter.dateFormat = format
        let dateFormat = dateFormmatter.string(from: self)
        return dateFormat
    }
}
