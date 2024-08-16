//
//  WeatherCondition.swift
//  Weather
//
//  Created by Joe Vargas on 8/9/24.
//

import Foundation
import SwiftUI

struct WeatherCondition: Codable {
    let description: String
    let icon: String
    let code: Int
    
    enum CodingKeys: String, CodingKey {
        case icon, code
        case description = "text"
    }
}
extension WeatherCondition {
    var iconImage: Image {
        switch code {
        case 1000: return Image(systemName: "sun.max")
        case 1003: return Image(systemName: "cloud.sun.fill")
        case 1006, 1009: return Image(systemName: "cloud.fill")
        case 1030: return Image(systemName: "cloud.fog.fill")
        case 1063, 1183, 1186, 1189, 1198, 1240, 1243, 1246, 1273: return Image(systemName: "cloud.rain.fill")
        case 1066, 1210, 1213, 1216, 1219, 1222, 1225, 1255, 1258, 1279: return Image(systemName: "cloud.snow.fill")
        case 1069, 1204, 1207, 1237, 1249, 1252, 1261, 1264: return Image(systemName: "cloud.sleet.fill")
        case 1072, 1150, 1153, 1168, 1171: return Image(systemName: "cloud.drizzle.fill")
        case 1087: return Image(systemName: "cloud.bolt.fill")
        case 1114, 1117: return Image(systemName: "wind.snow.circle.fill")
        case 1135, 1147: return Image(systemName: "cloud.fog.fill")
        case 1192, 1195, 1201, 1276: return Image(systemName: "cloud.heavyrain.fill")
        default: return Image(systemName: "cloud.snow.fill")
        }
    }
}
