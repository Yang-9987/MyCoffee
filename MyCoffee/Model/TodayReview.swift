//
//  Today Review.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/11.
//

import Foundation

struct TodayReview: Identifiable, Codable {
    var id: UUID
    var index: Date
    var mood: Mood
    var cupsCoffee: Int
    var beanStorage: Double
    
    init(id: UUID = UUID(), index: Date, mood: Mood, cupsCoffee: Int, beanStorage: Double) {
        self.id = id
        self.index = index
        self.mood = mood
        self.cupsCoffee = cupsCoffee
        self.beanStorage = beanStorage
    }
}
