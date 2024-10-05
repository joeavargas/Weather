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
    @State private var isLoading = true
    @State private var opacity = 0.0
    
    var body: some Scene {
        WindowGroup {
            if isLoading {
                LaunchScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.easeIn(duration: 1.0)) {
                                isLoading = false
                                opacity = 1.0
                            }
                        }
                    }
            } else if locationManager.location == nil {
                LocationRequestView()
            } else if let location = locationManager.location {
                TabViewContainer(location: location)
                    .opacity(opacity)
                
            }
        }
        .modelContainer(for: SearchedCity.self)
    }
}
