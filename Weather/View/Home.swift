//
//  Home.swift
//  Weather
//
//  Created by Joe Vargas on 8/2/24.
//

import SwiftUI
import CoreLocation

struct Home: View {
    let weatherData: CurrentWeatherResponse
    let vm: WeatherViewModel
    var body: some View {
        VStack{
            switch LocationManager.shared.authorizationStatus {
            case .denied, .notDetermined, .restricted:
                VStack(spacing: 30) {
                    if let locationAuthStatus = LocationManager.shared.authorizationStatus {
                        Text(locationAuthStatus.rawValue)
                    }
                    // TODO: add some sort of non-instrusive view that let's the user know
                    // that their location is not in use but have a button available to trigger
                    // asking the user to share their location.
                }
                
            default:
                if vm.isLoading {
                    ProgressView()
                } else {
                    if let weatherData = vm.weatherData {
                        CurrentWeatherView(weatherData: weatherData)
                    }
                }
            }
        }
    }
}

#Preview {
    Home(weatherData: .init(location: CurrentWeatherResponse.weatherLocationSample, current: CurrentWeatherResponse.currentWeatherSample, forecast: CurrentWeatherResponse.forecastSample), vm: WeatherViewModel())
}
