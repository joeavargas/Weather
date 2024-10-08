//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by Joe Vargas on 8/15/24.
//

import SwiftUI

struct CurrentWeatherView: View {
    let weatherData: CurrentWeatherResponse
    @State private var pickerSelection = 0
    @AppStorage("isMetric") private var isMetric: Bool = false
    var body: some View {
        ZStack {
            
            GradientBackgroundView()
            
            VStack(spacing: 30) {
                VStack(spacing: 10) {
                    Text(weatherData.location.cityAndStateRegion)
                    
                    Text("\(weatherData.location.formattedDate)")
                }
                
                Picker("", selection: $pickerSelection) {
                    Text("Forecast").tag(0)
                    Text("AQI & UV").tag(1)
                }
                .pickerStyle(.segmented)
                
                switch pickerSelection {
                case 0: CurrentWeatherForecastView(weatherData: weatherData, isMetric: isMetric)
                default: 
                    ScrollView {
                        CurrentWeatherAirQualityAndUvView(weatherData: weatherData)
                    }
                }
                
                if pickerSelection == 0 {
                    HStack {
                        Text("Today")
                        Spacer()
                        Text("View full report")
                    }
                    
                    // Hourly Weather View
                    CurrentWeatherHourlyView(weatherData: weatherData, isMetric: isMetric)
                }
                Spacer()
            }
            .foregroundStyle(.white)
            .padding()
            
        }
    }
}

#Preview {
    CurrentWeatherView(weatherData: .init(location: CurrentWeatherResponse.weatherLocationSample, current: CurrentWeatherResponse.currentWeatherSample, forecast: CurrentWeatherResponse.forecastSample))
}
