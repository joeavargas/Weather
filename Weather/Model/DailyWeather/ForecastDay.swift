//
//  ForecastDay.swift
//  Weather
//
//  Created by Joe Vargas on 8/10/24.
//

import Foundation

struct ForecastDay: Codable {
    let timestamp: Int
    let day: Day
    let hour: [Hour]
    
    enum CodingKeys: String, CodingKey {
        case day, hour
        case timestamp = "date_epoch"
    }
}
