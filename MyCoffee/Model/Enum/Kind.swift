//
//  Kind.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/6/8.
//

import Foundation

enum Kind: String, CaseIterable, Identifiable, Codable {
    case Arabica
    case Robusat
    case Liberica
    case Bourban
    case Caturra
    case Typica
    case Gesha
    
    var kindName: String {
        rawValue.capitalized
    }
    
    var id: String {
        kindName
    }
}
