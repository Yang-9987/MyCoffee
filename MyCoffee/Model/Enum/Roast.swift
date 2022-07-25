//
//  Roast.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/6/8.
//

import Foundation

enum Roast: String, CaseIterable, Identifiable, Codable {
    case Light
    case Medium
    case High
    case Deep
    case Dark
    
    var RoastName: String {
        rawValue
    }
    
    var id: String {
        RoastName
    }
}
