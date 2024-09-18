//
//  StoredCityWeatherData.swift
//  Weather
//
//  Created by Joe Vargas on 9/6/24.
//

import Foundation

struct StoredCityWeatherData: Codable, Identifiable {
    let id: UUID
    let location: WeatherLocation
    let current: CurrentWeather
    
    enum CodingKeys: String, CodingKey {
        case location, current
    }
    
    init(id: UUID = UUID(), location: WeatherLocation, current: CurrentWeather) {
        self.id = id
        self.location = location
        self.current = current
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()  // Generate a new UUID when decoding
        self.location = try container.decode(WeatherLocation.self, forKey: .location)
        self.current = try container.decode(CurrentWeather.self, forKey: .current)
    }
}
