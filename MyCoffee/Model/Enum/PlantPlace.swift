//
//  PlantPlace.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/6/8.
//

import Foundation

enum PlantPlace: String, CaseIterable, Identifiable, Codable {
    case LatinAmerica
    case Africa
    case AsiaPacific
    case MultiOrigin
    
    var PlaceName: String {
        rawValue
    }
    
    var id: String {
        PlaceName
    }
}

