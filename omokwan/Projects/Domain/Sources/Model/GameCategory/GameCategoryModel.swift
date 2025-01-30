//
//  GameCategoryModel.swift
//  Domain
//
//  Created by 김동준 on 11/30/24
//

public enum GameCategory: String, Equatable, CaseIterable {
    case workout = "운동"
    case health = "건강"
    case read = "독서"
    case hobby = "취미"
    case life = "생활"
    case study = "공부"
    case practice = "연습"
    case newsAndEducational = "시사/교양"
    case diet = "다이어트"
    case selfImprovement = "자기계발"
    case instrument = "악기"
    
    public var emoji: String {
        switch self {
        case .workout: "💪️"
        case .health: "🏃‍♀️"
        case .read: "📕"
        case .hobby: "🌈"
        case .life: "🫧"
        case .study: "📝"
        case .practice: "🔁"
        case .newsAndEducational: "🗞"
        case .diet: "🥗"
        case .selfImprovement: "📚"
        case .instrument: "🎵"
        }
    }
}
