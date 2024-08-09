//
//  CurrentWeatherResponse.swift
//  Weather
//
//  Created by Joe Vargas on 8/9/24.
//

import Foundation

struct CurrentWeatherResponse: Codable {
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
    let name: String
    let timestamp: Int
    let sys: Sys
    
    enum CodingKeys: String, CodingKey {
        case weather, main, visibility, wind, name, sys
        case timestamp = "dt"
    }
}
