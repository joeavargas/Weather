//
//  StoredCityWeatherData.swift
//  Weather
//
//  Created by Joe Vargas on 9/6/24.
//

import Foundation

struct StoredCityWeatherData: Identifiable, Codable {
    var id = UUID()
    
    let location: WeatherLocation
    let current: CurrentWeather
}
