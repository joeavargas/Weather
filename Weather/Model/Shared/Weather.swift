//
//  Weather.swift
//  Weather
//
//  Created by Joe Vargas on 8/9/24.
//

import Foundation

struct Weather: Codable {
    let id: Int
    /// `weatherParameter` returns values like `Rain, Snow, Clouds, etc`
    let weatherParameter: String
    let description: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case id, description, icon
        case weatherParameter = "main"
    }
}
