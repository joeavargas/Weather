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
                .fill( Color.nextHourBlue)
            
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

#Preview {
    HourlyViewCard(hour: CurrentWeatherResponse.forecastSample.forecastDay.first!.hour.first!, isMetric: false)
}
