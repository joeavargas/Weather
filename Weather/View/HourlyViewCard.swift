//
//  HourlyViewCard.swift
//  Weather
//
//  Created by Joe Vargas on 8/19/24.
//

import SwiftUI

struct HourlyViewCard: View {
    let hour: Hour
    let isMetric: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(isCurrentHour ? Color.nextHourBlue : Color.navyBlue)
            
            VStack {
                HStack(spacing: 10) {
                    hour.condition.iconImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                    
                    VStack {
                        Text(hour.formattedHour)
                        Text(isMetric ? "\(Int(hour.temperatureC))°C":
                                "\(Int(hour.temperatureF))°F")
                    }
                }
                .padding()
            }
            .padding(.horizontal, 6)
        }
        .frame(height: 75)
    }
}

extension HourlyViewCard {
    private var isCurrentHour: Bool {
        let currentHour = Calendar.current.component(.hour, from: Date())
        let hourFromTimestamp = Calendar.current.component(.hour, from: Date(timeIntervalSince1970: TimeInterval(hour.currentTimestamp)))
        
        return currentHour == hourFromTimestamp
    }
}

#Preview {
    HourlyViewCard(hour: CurrentWeatherResponse.forecastSample.forecastDay.first!.hour.first!, isMetric: false)
}
