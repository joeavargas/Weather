//
//  ForecastReportView.swift
//  Weather
//
//  Created by Joe Vargas on 8/21/24.
//

import SwiftUI

struct ForecastReportView: View {
    let weatherData: CurrentWeatherResponse
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
                                HourlyViewCard(hour: hour)
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
                    ForEach(0..<10) { _ in
                        DailyWeatherCardView()
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
