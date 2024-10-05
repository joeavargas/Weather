//
//  DailyWeatherCardView.swift
//  Weather
//
//  Created by Joe Vargas on 8/21/24.
//

import SwiftUI

struct DailyWeatherCardView: View {
    let day: ForecastDay
    let isMetric: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.lightNavyBlue)
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(day.formattedDay)
                        Text(day.formattedDate)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    
                    Text(isMetric ? "\(Int(day.day.maxTemperatureC))°C" :"\(Int(day.day.maxTemperatureF))°F")
                        .font(.system(size: 40))
                    
                    Spacer()
                    
                    day.day.condition.iconImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                    
                }
                .foregroundStyle(.white)
            .padding()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    DailyWeatherCardView(day: CurrentWeatherResponse.forecastSample.forecastDay.first!, isMetric: true)
}
