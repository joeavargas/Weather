//
//  PickLocationViewModel.swift
//  Weather
//
//  Created by Joe Vargas on 8/31/24.
//

import Foundation
import CoreLocation
import SwiftData
import Combine



@MainActor
class PickLocationViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchResults: [SearchedCity] = []
    @Published var storedCityWeatherData: [StoredCityWeatherData] = []
    @Published var isLoading = false
    @Published var errorMessage: IdentifiableError?
    
    private let network = Network()
    private var modelContext: ModelContext
    private var searchCancellable: AnyCancellable?
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        setupSearchPublisher()
    }
    
    private func setupSearchPublisher() {
        searchCancellable = $searchText
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] searchText in
                guard !searchText.isEmpty else { return }
                self?.searchCity()
            }
    }
    
    func searchCity() {
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(searchText) { [weak self] placemarks, error in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = IdentifiableError(message: "Geocoding error: \(error.localizedDescription)")
                    return
                }
                
                self.searchResults.removeAll()
                
                guard let placemarks = placemarks else {
                    self.errorMessage = IdentifiableError(message: "No locations found")
                    return
                }
                
                for placemark in placemarks {
                    let searchResult = SearchedCity(name: placemark.locality ?? "n/a",
                                                    state: placemark.administrativeArea ?? "n/a",
                                                    latitude: nil, longitude: nil)
                    
                    self.searchResults.append(searchResult)
                }
                
                if self.searchResults.isEmpty {
                    self.errorMessage = IdentifiableError(message: "No valid locations found")
                }
            }
        }
    }
    
    func getCoordinatesAndSaveCity(for selectedCity: SearchedCity) {
        getCoordinates(for: selectedCity.name + ", " + selectedCity.state) { coordinate in
            guard let coordinate = coordinate else { return }
            
            let cityToSave = SearchedCity(name: selectedCity.name,
                                          state: selectedCity.state,
                                          latitude: coordinate.latitude,
                                          longitude: coordinate.longitude)
            
            self.saveToSwiftData(cityToSave)
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
    
    private func saveToSwiftData(_ city: SearchedCity) {
        modelContext.insert(city)
        do {
            try modelContext.save()
            print("DEBUG: \(city.name) appended to storedCities")
            // After saving, reload the weather data for all cities
            Task {
                await loadWeatherDataForEachCity()
            }
        } catch {
            print("DEBUG: Error saving city to SwiftData: \(error)")
            errorMessage = IdentifiableError(message: "Failed to save city: \(error.localizedDescription)")
        }
    }
    
    func deleteCity(_ city: StoredCityWeatherData) {
        let cityName = city.location.city
        let stateName = city.location.stateOrRegion
        
        print("Attempting to delete city: \(cityName), \(stateName)")
        
        let predicate = #Predicate<SearchedCity> { searchedCity in
            searchedCity.name == cityName && searchedCity.state == stateName
        }
        
        let fetchDescriptor = FetchDescriptor<SearchedCity>(predicate: predicate)
        
        do {
            let citiesToDelete = try modelContext.fetch(fetchDescriptor)
            print("Found \(citiesToDelete.count) cities matching the criteria")
            
            guard let cityToDelete = citiesToDelete.first else {
                print("City not found in SwiftData: \(cityName), \(stateName)")
                return
            }
            
            print("Deleting city: \(cityToDelete.name), \(cityToDelete.state)")
            modelContext.delete(cityToDelete)
            try modelContext.save()
            
            // Remove the city from the storedCityWeatherData array
            storedCityWeatherData.removeAll { $0.location.city == cityName && $0.location.stateOrRegion == stateName }
            print("City deleted successfully")
            
        } catch {
            print("Failed to delete city: \(error)")
            errorMessage = IdentifiableError(message: "Failed to delete city: \(error.localizedDescription)")
        }
    }
    
    func loadWeatherDataForEachCity() async {
        isLoading = true
        storedCityWeatherData.removeAll()
        
        let fetchDescriptor = FetchDescriptor<SearchedCity>(sortBy: [SortDescriptor(\.name)])
        
        do {
            let storedCities = try modelContext.fetch(fetchDescriptor)
            
            for city in storedCities {
                print("DEBUG: \(city.name), \(city.state)", #function)
                do {
                    let newCityToFetchWeatherFor = try await network.fetch(lat: city.latitude ?? 0.0,
                                                                           lon: city.longitude ?? 0.0,
                                                                           type: StoredCityWeatherData.self)
                    
                    let newEntry = StoredCityWeatherData(location: newCityToFetchWeatherFor.location,
                                                         current: newCityToFetchWeatherFor.current)
                    
                    self.storedCityWeatherData.append(newEntry)
                    
                } catch {
                    print("DEBUG: error loading city weather data", error)
                    errorMessage = IdentifiableError(message: error.localizedDescription)
                }
            }
        } catch {
            print("DEBUG: error fetching stored cities", error)
            errorMessage = IdentifiableError(message: "Failed to fetch stored cities: \(error.localizedDescription)")
        }
        
        isLoading = false
    }
    
    func printAllCities() {
        do {
            let allCities = try modelContext.fetch(FetchDescriptor<SearchedCity>())
            print("All cities in SwiftData:")
            for city in allCities {
                print("- \(city.name), \(city.state)")
            }
        } catch {
            print("Failed to fetch cities: \(error)")
        }
    }
}

