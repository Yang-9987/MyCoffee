//
//  Test.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/8.
//

import Foundation

struct Test: Identifiable, Codable, Hashable {
    
    var id: UUID
    var time: String
    
    init(id: UUID = UUID(), time: String) {
        self.id = id
        self.time = time
    }
}
