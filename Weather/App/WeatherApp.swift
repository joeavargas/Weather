//
//  WeatherApp.swift
//  Weather
//
//  Created by Joe Vargas on 8/2/24.
//

import SwiftUI
import SwiftData

@main
struct WeatherApp: App {
    @ObservedObject var locationManager = LocationManager.shared
    
    var body: some Scene {
        WindowGroup {
            if locationManager.location == nil {
                LocationRequestView()
            } else if let location = locationManager.location {
                TabViewContainer(location: location)
            }
        }
        .modelContainer(for: SearchedCity.self)
    }
}
