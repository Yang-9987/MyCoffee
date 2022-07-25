//
//  Process.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/6/8.
//

import Foundation

enum Process: String, CaseIterable, Identifiable, Codable {
    case HoneyProcess
    case NaturalProcess
    case WashedProcess
    case Monsooning
    case PulpedNaturalProcess
    
    var processName: String {
        switch self {
        case .HoneyProcess:
            return "Honey Process"
        case .NaturalProcess:
            return "Natural Process"
        case .WashedProcess:
            return "WashedProcess"
        case .Monsooning:
            return "Monsooning"
        case .PulpedNaturalProcess:
            return "Pulped Natural Process"
        }
    }
    
    var id: String {
        processName
    }
}
