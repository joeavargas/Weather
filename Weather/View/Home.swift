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
        VStack {
            Text("\(location)")
        }
        .task {
            await vm.loadWeatherData(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        }
    }
}

#Preview {
    Home(location: CLLocation(latitude: 29.749907, longitude: -95.358421))
}
