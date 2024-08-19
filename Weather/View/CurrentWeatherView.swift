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
            weatherData.current.condition.iconImage.renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .padding()
            
            HStack {
                
                VStack {
                    Text("Temp")
                    Text("\(Int(weatherData.current.temperatureF))°")
                }
                Spacer()
                VStack {
                    Text("Wind")
                    Text("\(Int(weatherData.current.windSpeedMph))mph")
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

struct HourlyViewCard: View {
    let hour: Hour
    var body: some View {
        HStack {
            hour.condition.iconImage
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .padding()
            VStack {
                Text(hour.formattedHour)
                Text("\(Int(hour.temperatureF))°")
            }
        }
        .padding()
    }
}

#Preview {
    CurrentWeatherView(weatherData: .init(location: CurrentWeatherResponse.weatherLocationSample, current: CurrentWeatherResponse.currentWeatherSample, forecast: CurrentWeatherResponse.forecastSample))
}
