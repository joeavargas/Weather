//
//  Forecast.swift
//  Weather
//
//  Created by Joe Vargas on 8/10/24.
//

import Foundation

struct Forecast: Codable {
    let forecastDay: [ForecastDay]
    
    enum CodingKeys: String, CodingKey {
        case forecastDay = "forecastday"
    }
}
