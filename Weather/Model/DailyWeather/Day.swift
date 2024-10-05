//
//  Day.swift
//  Weather
//
//  Created by Joe Vargas on 8/9/24.
//

import Foundation

struct Day: Codable {
    let condition: WeatherCondition
    let uv: Double
    let airQuality: AirQuality?
    
    // Imperial
    let maxTemperatureF: Double
    let minTemperatureF: Double
    
    // Metric
    let maxTemperatureC: Double
    let minTemperatureC: Double

    
    enum CodingKeys: String, CodingKey {
        case condition, uv
        case airQuality = "air_quality"
        
        // Imperial
        case maxTemperatureF = "maxtemp_f"
        case minTemperatureF = "mintemp_f"
        
        // Metric
        case maxTemperatureC = "maxtemp_c"
        case minTemperatureC = "mintemp_c"
        

    }
}
