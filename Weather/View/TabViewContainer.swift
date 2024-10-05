//
//  TabViewContainer.swift
//  Weather
//
//  Created by Joe Vargas on 8/19/24.
//

import SwiftUI
import CoreLocation
import SwiftData

struct TabViewContainer: View {
    @StateObject private var vm = WeatherViewModel()
    @Environment(\.modelContext) private var modelContext
    @Environment(\.colorScheme) var colorScheme
    let location: CLLocation
    
    var body: some View {
        TabView {
            if let weatherData = vm.weatherData {
                Home(weatherData: weatherData, vm: vm)
                    .tabItem {
                        Label("", systemImage: "house.fill")
                    }
                
                PickLocationView(modelContext: modelContext)
                    .tabItem {
                        Label("", systemImage: "magnifyingglass")
                    }
                
                ForecastReportView(weatherData: weatherData)
                    .tabItem {
                        Label("", systemImage: "chart.xyaxis.line")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("", systemImage: "gearshape.fill")
                    }
                /// Force `SettingsView` to have a dark theme so
                /// `navigationTitle` can have a foreground color of `.white`
                    .environment(\.colorScheme, .dark)
            }
        }
        .task {
            await vm.loadWeatherData(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        }
        .onChange(of: location) {
            Task {
                await vm.loadWeatherData(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
            }
        }
    }
}

#Preview {
    TabViewContainer(location: CLLocation(latitude: 29.749907, longitude: -95.358421))
        .modelContainer(for: SearchedCity.self)
}
