//
//  List.swift
//  Weather
//
//  Created by Joe Vargas on 8/9/24.
//

import Foundation

struct List: Codable {
    let timestamp: Int
    let main: Main
    let weather: [Weather]
    let temp: Temp
    
    enum CodingKeys: String, CodingKey {
        case timestamp = "dt"
        case weather, main, temp
    }
}
