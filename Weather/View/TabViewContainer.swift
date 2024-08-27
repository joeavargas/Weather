//
//  TabViewContainer.swift
//  Weather
//
//  Created by Joe Vargas on 8/19/24.
//

import SwiftUI
import CoreLocation

struct TabViewContainer: View {
    @StateObject private var vm = WeatherViewModel()
    let location: CLLocation
    var body: some View {
        TabView {
            if let weatherData = vm.weatherData {
                Home(weatherData: weatherData, vm: vm)
                    .tabItem {
                        Label("", systemImage: "house.fill")
                    }
                
                
                PickLocationView()
                    .tabItem {
                        Label("", systemImage: "magnifyingglass")
                    }
                
                ForecastReportView(weatherData: weatherData)
                    .tabItem {
                        Label("", systemImage: "chart.xyaxis.line")
                    }
                
                
                Text("SettingsView")
                    .tabItem {
                        Label("", systemImage: "gearshape.fill")
                    }
            }
        }
        .task {
            await vm.loadWeatherData(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        }
    }
}

#Preview {
    TabViewContainer(location: CLLocation(latitude: 29.749907, longitude: -95.358421))
}
