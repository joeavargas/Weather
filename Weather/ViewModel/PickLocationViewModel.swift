//
//  PickLocationViewModel.swift
//  Weather
//
//  Created by Joe Vargas on 8/31/24.
//

import Foundation
import CoreLocation

@MainActor
class PickLocationViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchResults: [SearchedCity] = []
    @Published var storedCities: [SearchedCity] = []
    @Published var storedCityWeatherData: [StoredCityWeatherData] = []
    private let network = Network()
    
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let storageKey = "storedCities"
    
    func searchCity() {
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(searchText) { placemarks, error in
            if let error = error {
                return
            }
            self.searchResults.removeAll()
            
            guard let placemarks = placemarks else { return }
            
            for placemark in placemarks {
                let searchResult = SearchedCity(name: placemark.locality ?? "n/a",
                                                state: placemark.administrativeArea ?? "n/a",
                                                latitude: nil, longitude: nil)
                
                self.searchResults.append(searchResult)
            }
        }
    }
    
    func selectedCity(selectedCity: SearchedCity) {
        getCoordinates(for: selectedCity.name + ", " + selectedCity.state) { [weak self] coordinate in
            guard let coordinate = coordinate else { return }
            
            let selectedCity = SearchedCity(name: selectedCity.name,
                                            state: selectedCity.state,
                                            latitude: coordinate.latitude,
                                            longitude: coordinate.longitude)
            
            self?.saveCity(selectedCity)
        }
    }
    
    private func getCoordinates(for address: String, 
                                completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            guard let location = placemarks?.first?.location, error == nil else {
                completion(nil)
                return
            }
            
            completion(location.coordinate)
        }
    }
    
    private func saveCity(_ city: SearchedCity) {
        storedCities.append(city)
        print("DEBUG: city appended to storedCities")
        storeToPersistentStorage()
        
    }
    
    private func storeToPersistentStorage() {
        
        if let data = try? JSONEncoder().encode(storedCities) {
            UserDefaults.standard.set(data, forKey: storageKey)
            print("DEBUG: city added to persistent data")
        }
    }
    
    func loadStoredCities() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let savedCities = try? JSONDecoder().decode([SearchedCity].self, from: data) {
            storedCities = savedCities
        }
    }
}
