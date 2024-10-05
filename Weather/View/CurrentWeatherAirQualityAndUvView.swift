//
//  CurrentWeatherAirQualityAndUvView.swift
//  Weather
//
//  Created by Joe Vargas on 8/19/24.
//

import SwiftUI

struct CurrentWeatherAirQualityAndUvView: View {
    let weatherData: CurrentWeatherResponse
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                AirQualityCardView(airQuality: weatherData.current.airQuality)
            }
            .padding(.horizontal)
            
            UVCardView(currentWeather: weatherData.current)
        }
        .padding()
    }
}

#Preview {
    CurrentWeatherAirQualityAndUvView(weatherData: CurrentWeatherResponse.init(location: CurrentWeatherResponse.weatherLocationSample, current: CurrentWeatherResponse.currentWeatherSample, forecast: CurrentWeatherResponse.forecastSample))
}
