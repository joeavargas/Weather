//
//  Wind.swift
//  Weather
//
//  Created by Joe Vargas on 8/9/24.
//

import Foundation

struct Wind: Codable {
    let speed: Double
    let degrees: Int
    
    enum CodingKeys: String, CodingKey {
        case speed
        case degrees = "deg"
    }
}
