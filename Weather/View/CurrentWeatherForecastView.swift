//
//  CurrentWeatherForecastView.swift
//  Weather
//
//  Created by Joe Vargas on 8/19/24.
//

import SwiftUI

struct CurrentWeatherForecastView: View {
    let weatherData: CurrentWeatherResponse
    let isMetric: Bool
    
    var body: some View {
        VStack {
            weatherData.current.condition.iconImage.renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .padding()
            
            HStack {
                
                VStack {
                    Text("Temp")
                    Text(isMetric ? "\(Int(weatherData.current.temperatureC))°C" : "\(Int(weatherData.current.temperatureF))°F")
                }
                Spacer()
                VStack {
                    Text("Wind")
                    Text(isMetric ? "\(Int(weatherData.current.windSpeedKph)) km/h" : "\(Int(weatherData.current.windSpeedMph)) mph")
                }
                Spacer()
                VStack {
                    Text("Humidity")
                    Text("\(weatherData.current.humidity)%")
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CurrentWeatherForecastView(weatherData: CurrentWeatherResponse.init(location: CurrentWeatherResponse.weatherLocationSample, current: CurrentWeatherResponse.currentWeatherSample, forecast: CurrentWeatherResponse.forecastSample), isMetric: true)
}
