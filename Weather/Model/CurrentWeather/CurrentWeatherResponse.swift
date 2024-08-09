//
//  CurrentWeatherResponse.swift
//  Weather
//
//  Created by Joe Vargas on 8/9/24.
//

import Foundation

struct CurrentWeatherResponse: Codable {
    let location: WeatherLocation
    let current: CurrentWeather
//    let forecast: Forecast
    
}
