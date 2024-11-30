//
//  GameCategoryModel.swift
//  Domain
//
//  Created by 김동준 on 11/30/24
//

public struct GameCategoryModel: Equatable, Hashable {
    public let imoji: String
    public let title: String
    
    public init(
        imoji: String,
        title: String
    ) {
        self.imoji = imoji
        self.title = title
    }
    
    static public var gameCategories = [
        GameCategoryModel(imoji: "💪️", title: "운동"),
        GameCategoryModel(imoji: "🏃‍♀️", title: "건강"),
        GameCategoryModel(imoji: "📕", title: "독서"),
        GameCategoryModel(imoji: "🌈", title: "취미"),
        GameCategoryModel(imoji: "🫧", title: "생활"),
        GameCategoryModel(imoji: "📝", title: "공부"),
        GameCategoryModel(imoji: "🔁", title: "연습"),
        GameCategoryModel(imoji: "🗞", title: "시사/교양"),
        GameCategoryModel(imoji: "🥗", title: "다이어트"),
        GameCategoryModel(imoji: "📚", title: "자기계발"),
        GameCategoryModel(imoji: "🎵", title: "악기")
    ]
}
