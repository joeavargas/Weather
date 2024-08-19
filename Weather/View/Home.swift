//
//  Home.swift
//  Weather
//
//  Created by Joe Vargas on 8/2/24.
//

import SwiftUI
import CoreLocation

struct Home: View {
    let location: CLLocation
    @StateObject private var vm = WeatherViewModel()
    
    var body: some View {
        VStack{
            switch LocationManager.shared.authorizationStatus {
            case .denied, .notDetermined, .restricted:
                VStack(spacing: 30) {
                    Text("\(location)")
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
        .task {
           await vm.loadWeatherData(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        }
    }
}

#Preview {
    Home(location: CLLocation(latitude: 29.749907, longitude: -95.358421))
}
