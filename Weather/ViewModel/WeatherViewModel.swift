//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Joe Vargas on 8/10/24.
//

import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    
    @Published var weatherData: CurrentWeatherResponse?
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let network = Network()
    
    func loadWeatherData(lat: Double, lon: Double) async {
        isLoading = true
        errorMessage = nil
        
        do {
            weatherData = try await network.fetch(
                lat: lat,
                lon: lon,
                type: CurrentWeatherResponse.self)
            isLoading = false
            
        } catch {
            errorMessage = error.localizedDescription
            print("DEBUG: error \(String(describing: errorMessage))")
        }
        
        isLoading = false
    }
}
