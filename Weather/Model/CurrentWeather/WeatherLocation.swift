//
//  WeatherLocation.swift
//  Weather
//
//  Created by Joe Vargas on 8/9/24.
//

import Foundation

struct WeatherLocation: Codable {
    let city: String
    let stateOrRegion: String
    let localTime: Int
    
    enum CodingKeys: String, CodingKey {
        case city = "name"
        case stateOrRegion = "region"
        case localTime = "localtime_epoch"
    }
    
}
