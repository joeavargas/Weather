//
//  Home.swift
//  Weather
//
//  Created by Joe Vargas on 8/2/24.
//

import SwiftUI

struct Home: View {
    @StateObject private var vm = WeatherViewModel()
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .task {
            await vm.loadWeatherData(lat: 29.749907, lon: -95.358421)
        }
    }
}

#Preview {
    Home()
}
