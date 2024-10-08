//
//  AirQuality.swift
//  Weather
//
//  Created by Joe Vargas on 8/9/24.
//

import SwiftUI

struct AirQuality: Codable {
    let epaIndex: Int?
    var epaIndexDescription: String {
        if let index = epaIndex {
            switch index {
            case 0...50: return "Good"
            case 51...100: return "Moderate"
            case 101...150: return "Unhealthy for Sensitive Groups"
            case 151...200: return "Unhealthy"
            case 201...300: return "Very Unhealthy"
            default: return "Hazardous"
            }
        } else {
            return "EPA Index unavailable"
        }
    }
    
    var epaIndexBackgroundColor: Color {
        if let index = epaIndex {
            switch index {
            case 0...50: return .green
            case 51...100: return .yellow
            case 101...150: return .orange
            case 151...200: return .red
            case 201...300: return .purple
            default: return .maroon
            }
        } else {
            return .black
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case epaIndex = "us-epa-index"
    }
    
}
