//
//  Day.swift
//  Weather
//
//  Created by Joe Vargas on 8/9/24.
//

import Foundation

struct Day: Codable {
    let condition: WeatherCondition
    let uv: Int
    let airQuality: AirQuality
    
    // Imperial
    let maxTemperatureF: Int
    let minTemperatureF: Int
    
    // Metric
    let maxTemperatureC: Int
    let minTemperatureC: Int

    
    enum CodingKeys: String, CodingKey {
        case condition, uv, airQuality
        
        // Imperial
        case maxTemperatureF = "maxtemp_f"
        case minTemperatureF = "mintemp_f"
        
        // Metric
        case maxTemperatureC = "maxtemp_c"
        case minTemperatureC = "mintemp_c"
        

    }
}
