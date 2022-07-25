//
//  Kind.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/6/8.
//

import Foundation

enum acidity_body: String, CaseIterable, Identifiable, Codable {
    case Low
    case MediumLow
    case Medium
    case MediumHigh
    case High
    
    var degree: String {
        switch self {
        case .Low:
            return "Low"
        case .MediumLow:
            return "Medium-Low"
        case .Medium:
            return "Medium"
        case .MediumHigh:
            return "Medium-High"
        case .High:
            return "High"
        }
    }
    
    var id: String {
        degree
    }
}
