//
//  WeatherCondition.swift
//  Weather
//
//  Created by Joe Vargas on 8/9/24.
//

import Foundation

struct WeatherCondition: Codable {
    let description: String
    let icon: String
    let code: Int
    
    enum CodingKeys: String, CodingKey {
        case icon, code
        case description = "text"
    }
}
