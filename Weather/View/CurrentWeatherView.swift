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
    var body: some View {
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
            case 0: CurrentWeatherForecastView(weatherData: weatherData)
            default: CurrentWeatherAirQualityAndUvView(weatherData: weatherData)
            }
            
            if pickerSelection == 0 {
                HStack {
                    Text("Today")
                    Spacer()
                    Text("View full report")
                }
                
                // Hourly Weather View
                CurrentWeatherHourlyView(weatherData: weatherData)
            }
            Spacer()
        }
        .padding()
    }
}

struct CurrentWeatherForecastView: View {
    let weatherData: CurrentWeatherResponse
    
    var body: some View {
        VStack {
            Image(systemName: "cloud.sun.rain")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .padding()
            
            HStack {
                
                VStack {
                    Text("Temp")
                    Text("32°")
                }
                Spacer()
                VStack {
                    Text("Wind")
                    Text("10mph")
                }
                Spacer()
                VStack {
                    Text("Humidity")
                    Text("75%")
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CurrentWeatherAirQualityAndUvView: View {
    let weatherData: CurrentWeatherResponse
    
    var body: some View {
        VStack(spacing: 50) {
            VStack {
                Text("149")
                    .font(.system(size: 100))
                
                Text("Unhealthy for Sensitive Groups")
                    .font(.headline)
            }
            
            VStack {
                Text("10")
                    .font(.system(size: 100))
                
                Text("Protection against sun damage is needed. If you need to be outside during midday hours between 10am and 4pm, take steps to reduce sun exposure. A shirt, hat and sunscreen are a must, and be sure to seek shade. Beachgoers should know that white sand and other bright surfaces reflect UV and can double UV exposure")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
    }
}

struct CurrentWeatherHourlyView: View {
    let weatherData: CurrentWeatherResponse
    var body: some View {
        ScrollView(.horizontal){
            HStack {
                ForEach(0..<8) { _ in
                    HourlyViewCard()
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

struct HourlyViewCard: View {
    
    var body: some View {
        HStack {
            Image(systemName: "cloud.sun.rain")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
            VStack {
                Text("1:00 PM")
                Text("100°")
            }
        }
    }
}

//#Preview {
//    CurrentWeatherView(weatherData: .init(location: <#T##WeatherLocation#>, current: <#T##CurrentWeather#>, forecast: <#T##Forecast#>))
//}
