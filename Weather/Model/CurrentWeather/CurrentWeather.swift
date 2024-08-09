//
//  CurrentWeather.swift
//  Weather
//
//  Created by Joe Vargas on 8/9/24.
//

import Foundation

struct CurrentWeather: Codable {
    // Imperial
    let currentTimestamp: Int
    let temperature: Double
    let condition: WeatherCondition
    let windSpeed: Double
    let windDirection: String
    let pressureMb: Double
    let humidity: Int
    let feelsLikeTemperature: Double
    let dewpoint: Double
    let visibility: Double
    let uv: Double
    let airQuality: AirQuality
    
    // Metric
    let temperatureC: Double
    let windSpeedKph: Double
    let feelsLikeTemperatureC: Double
    let dewpointC: Double
    let visibilityKm: Double
    
    enum CodingKeys: String, CodingKey {
        // Imperial
        case condition, humidity, uv
        case currentTimestamp = "last_updated_epoch"
        case temperature = "temp_f"
        case windSpeed = "wind_mph"
        case windDirection = "wind_dir"
        case pressureMb = "pressure_mb"
        case feelsLikeTemperature = "feelslike_f"
        case dewpoint = "dewpoint_f"
        case visibility = "vis_miles"
        case airQuality = "air_quality"
        
        // Metric
        case temperatureC = "temp_c"
        case windSpeedKph = "wind_kph"
        case feelsLikeTemperatureC = "feelslike_c"
        case dewpointC = "dewpoint_c"
        case visibilityKm = "vis_km"
    }
}
