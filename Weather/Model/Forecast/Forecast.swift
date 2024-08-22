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
extension Forecast {
    // TODO: filter out the first two elements aka the first two days and generate a new array
    /// Example: `var filteredDays: [ForecastDay] {...}`
}
