//
//  weatherKit.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/20.
//

import Foundation
import WeatherKit
import CoreLocation

// MARK:  WeatherKit-Data
class weatherData: ObservableObject {
    var weather: Weather?
    
    var latitude: Double
    var longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func getWeather() async -> Weather {
        do {
            weather = try await Task.detached(priority: .userInitiated) {
                return try await WeatherService.shared
                    .weather(for: CLLocation(latitude: .init(floatLiteral: self.latitude), longitude: .init(floatLiteral: self.longitude)))
            }.value
        } catch {
            print("\(error)")
        }
        
        return weather!
    }
}
