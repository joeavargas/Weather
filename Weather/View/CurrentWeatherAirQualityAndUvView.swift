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
        VStack(spacing: 50) {
            VStack {
                if let epaIndex = weatherData.current.airQuality.epaIndex {
                Text("\(epaIndex)")
                        .font(.system(size: 100))
                    
                    Text(weatherData.current.airQuality.epaIndexDescription)
                        .font(.headline)
                        .foregroundStyle(weatherData.current.airQuality.epaIndexBackgroundColor)
                }
            }
            
            VStack(spacing: 12) {
                Text("\(Int(weatherData.current.uv))")
                    .font(.system(size: 100))
                
                Text(weatherData.current.uvExposureCategory)
                    .font(.headline)
                    .foregroundStyle(weatherData.current.uvExposureCategorColor)
                
                Text(weatherData.current.uvDescription)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
    }
}

#Preview {
    CurrentWeatherAirQualityAndUvView(weatherData: CurrentWeatherResponse.init(location: CurrentWeatherResponse.weatherLocationSample, current: CurrentWeatherResponse.currentWeatherSample, forecast: CurrentWeatherResponse.forecastSample))
}
