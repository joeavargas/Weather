//
//  CurrentWeatherHourlyView.swift
//  Weather
//
//  Created by Joe Vargas on 8/19/24.
//

import SwiftUI

struct CurrentWeatherHourlyView: View {
    let weatherData: CurrentWeatherResponse
    var body: some View {
        ScrollView(.horizontal){
            HStack {
                if let filteredHours = weatherData.forecast.forecastDay.first?.filteredHours {
                    ForEach(filteredHours, id: \.currentTimestamp) { hour in
                        HourlyViewCard(hour: hour)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    CurrentWeatherHourlyView(weatherData: .init(location: CurrentWeatherResponse.weatherLocationSample, current: CurrentWeatherResponse.currentWeatherSample, forecast: CurrentWeatherResponse.forecastSample))
}
