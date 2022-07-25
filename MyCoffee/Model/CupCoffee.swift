//
//  CupCoffee.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/24.
//

import Foundation

struct CupCoffee: Identifiable, Codable {
    var id: UUID
    var name: String
    var shop: String
    var comment: String
    var score: Double
    
    init(id: UUID = UUID(), name: String, shop: String, comment: String, score: Double) {
        self.id = id
        self.name = name
        self.shop = shop
        self.comment = comment
        self.score = score
    }
}
