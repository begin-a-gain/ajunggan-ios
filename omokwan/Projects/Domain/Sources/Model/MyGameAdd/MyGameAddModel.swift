//
//  MyGameAddModel.swift
//  Domain
//
//  Created by 김동준 on 12/1/24
//

public enum MyGameAddRepeatDayType: String {
    case weekday = "주중"
    case weekend = "주말"
    case everyday = "매일"
    case directSelection = "직접선택"
}

public enum MyGameAddDirectSelectionDayType: String, CaseIterable {
    case sun = "일"
    case mon = "월"
    case tue = "화"
    case wed = "수"
    case thu = "목"
    case fri = "금"
    case sat = "토"
}
