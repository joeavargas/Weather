//
//  Hour.swift
//  Weather
//
//  Created by Joe Vargas on 8/9/24.
//

import Foundation

struct Hour: Codable {
    // Imperial
    let currentTimestamp: Int
    let temperatureF: Double
    let condition: WeatherCondition
    let windSpeedMph: Double
    let windDirection: String
    let pressureMb: Double
    let humidity: Int
    let feelsLikeTemperatureF: Double
    let visibilityMiles: Double
    let uv: Double
    let airQuality: AirQuality
    
    // Metric
    let temperatureC: Double
    let windSpeedKph: Double
    let feelsLikeTemperatureC: Double
    let visibilityKm: Double
    
    enum CodingKeys: String, CodingKey {
        // Imperial
        case condition, humidity, uv
        case currentTimestamp = "last_updated_epoch"
        case temperatureF = "temp_f"
        case windSpeedMph = "wind_mph"
        case windDirection = "wind_dir"
        case pressureMb = "pressure_mb"
        case feelsLikeTemperatureF = "feelslike_f"
        case visibilityMiles = "vis_miles"
        case airQuality = "air_quality"
        
        // Metric
        case temperatureC = "temp_c"
        case windSpeedKph = "wind_kph"
        case feelsLikeTemperatureC = "feelslike_c"
        case visibilityKm = "vis_km"
    }
}
