//
//  CurrentWeather.swift
//  Weather
//
//  Created by Joe Vargas on 8/9/24.
//

import Foundation
import SwiftUI

struct CurrentWeather: Codable {
    // Imperial
    let currentTimestamp: Int
    let temperatureF: Double
    let condition: WeatherCondition
    let windSpeedMph: Double
    let windDirection: String
    let pressureMb: Double
    let humidity: Int
    let feelsLikeTemperatureF: Double
    let dewpointF: Double
    let visibilityMiles: Double
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
        case temperatureF = "temp_f"
        case windSpeedMph = "wind_mph"
        case windDirection = "wind_dir"
        case pressureMb = "pressure_mb"
        case feelsLikeTemperatureF = "feelslike_f"
        case dewpointF = "dewpoint_f"
        case visibilityMiles = "vis_miles"
        case airQuality = "air_quality"
        
        // Metric
        case temperatureC = "temp_c"
        case windSpeedKph = "wind_kph"
        case feelsLikeTemperatureC = "feelslike_c"
        case dewpointC = "dewpoint_c"
        case visibilityKm = "vis_km"
    }
}
extension CurrentWeather {
    var uvExposureCategory: String {
        switch uv {
        case 0...2: return "Low"
        case 3...5: return "Moderate"
        case 6...7: return "High"
        case 8...10: return "Very High"
        default: return "Extreme"
        }
    }
    
    var uvExposureCategorColor: Color {
        switch uv {
        case 0...2: return .green
        case 3...5: return .yellow
        case 6...7: return .orange
        case 8...10: return .red
        default: return .maroon
        }
    }
    
    var uvDescription: String {
        switch uv {
        case 0...2: 
            return "You can safely enjoy being outside. Wear sunglasses on bright days. If you burn easily, cover up and use scnscreen SPF 15+. In Winter, reflection off snow can nearly double UV strength"
        case 3...5:
            return "Take precautions if you will be outside, such as wearing a hat and sunglasses and using sunscreen SPF30+. Reduce your exposure to the sun's most intense UV radiation by seeking shade during midday hours."
        case 6...7:
            return "Protection against sun damage is needed. Wear a wide-brimmed hat and sunglasses, use sunscreen SPF 30+ and wear a long sleeved shirt and pants when practical. Reduce your exposure to the sun's most intense UV radiation by seeking shade during midday hours."
        case 8...10:
            return "Protection against sun damage is needed. If you need to be outside during midday hours between 10am and 4pm, take steps to reduce sun exposure. A shirt, hat and sunscreen are a must, and be sure to seek shade. Beachgoers should know that white sand and other bright surfaces reflect UV and can double UV exposure"
        default:
            return "Protection against sun damage is needed. If you need to be outside during midday hours between 10am and 4pm, take steps to reduce sun exposure. A shirt, hat and sunscreen are a must, and be sure you seek shade. Beachgoers should know that white sand and other bright services reflect UV and can double UV exposure."
        }
    }
}
