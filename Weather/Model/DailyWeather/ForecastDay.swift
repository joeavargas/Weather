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
        case day
        case hour
        case timestamp = "date_epoch"
    }
}
extension ForecastDay {
    
    /// Returns `Thursday`
    var formattedDay: String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "EEEE"
                
        return dateFormatter.string(from: date)
    }
    
    /// Returns `August 22`
    var formattedDate: String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "MMMM dd"
                
        return dateFormatter.string(from: date)
    }
    
    var filteredHours: [Hour] {
        // Get the current hour from the current time
        let currentHour = Calendar.current.component(.hour, from: Date())
        // Filter the hours array
        let filteredHours = hour.filter { hour in
            // Convert the unix timestamp hour element from array
            let date = Date(timeIntervalSince1970: Double(hour.currentTimestamp))
            // Get hour from every hour element
            let hourComponent = Calendar.current.component(.hour, from: date)
            // Return true if the hour component is greater than the current hour
            return hourComponent > currentHour
        }
        
        return filteredHours
    }
}
