//
//  ForecastReportView.swift
//  Weather
//
//  Created by Joe Vargas on 8/21/24.
//

import SwiftUI

struct ForecastReportView: View {
    let weatherData: CurrentWeatherResponse
    @AppStorage("isMetric") private var isMetric: Bool = false
    var body: some View {
        ZStack {
            GradientBackgroundView()
            
            VStack {
                Text("Forecast report")
                    .padding(.bottom)
                
                HStack {
                    Text("Today")
                    Spacer()
                    Text("August 21, 2024")
                }
                
                ScrollView(.horizontal){
                    HStack {
                        if let filteredHours = weatherData.forecast.forecastDay.first?.filteredHours {
                            ForEach(filteredHours, id: \.currentTimestamp) { hour in
                                HourlyViewCard(hour: hour, isMetric: isMetric)
                            }
                        }
                    }
                }
                .padding([.top, .bottom])
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Next Forecast")
                    Spacer()
                    Image(systemName: "calendar")
                }
                .padding([.top, .bottom])
                
                ScrollView {
                    /// `dropFirst(2)` elements which are `yesterday's` and `today's` date
                    ForEach(weatherData.forecast.forecastDay.dropFirst(2), id: \.timestamp) { day in
                        DailyWeatherCardView(day: day, isMetric: isMetric)
                    }
                }
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
        }
    }
}

#Preview {
    ForecastReportView(weatherData: .init(location: CurrentWeatherResponse.weatherLocationSample, current: CurrentWeatherResponse.currentWeatherSample, forecast: CurrentWeatherResponse.forecastSample))
}
