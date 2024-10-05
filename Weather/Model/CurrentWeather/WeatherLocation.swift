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
    var cityAndStateRegion: String {
        return city + ", " + stateOrRegion
    }
    let localTime: Int
    
    var formattedDate: String {
        let date = Date(timeIntervalSince1970: TimeInterval(localTime))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.locale = Locale.current
        
        return dateFormatter.string(from: date)
    }
    
    enum CodingKeys: String, CodingKey {
        case city = "name"
        case stateOrRegion = "region"
        case localTime = "localtime_epoch"
    }
    
}
