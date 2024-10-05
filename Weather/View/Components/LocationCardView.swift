//
//  LocationCardView.swift
//  Weather
//
//  Created by Joe Vargas on 8/27/24.
//

import SwiftUI

struct LocationCardView: View {
    let storedCityWeatherData: StoredCityWeatherData
    let isMetric: Bool
    
    private let imageDimensions = 40.0
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.aquaBlue)
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 24) {
                        VStack(alignment: .leading) {
                            Text(isMetric ? "\(Int(storedCityWeatherData.current.temperatureC))°C":
                                    "\(Int(storedCityWeatherData.current.temperatureF))°F")
                            .font(.title2)
                            .fontWeight(.bold)
                            Text(storedCityWeatherData.current.condition.description)
                                .foregroundStyle(.secondary)
                        }
                        
                        storedCityWeatherData.current.condition.iconImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageDimensions, height: imageDimensions)
                    }
                    
                    Text(storedCityWeatherData.location.city)
                        .foregroundStyle(.white)
                }
                .padding()
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    LocationCardView(storedCityWeatherData: StoredCityWeatherData(location: CurrentWeatherResponse.weatherLocationSample, current: CurrentWeatherResponse.currentWeatherSample), isMetric: true)
}
