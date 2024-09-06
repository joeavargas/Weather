//
//  PickLocationViewModel.swift
//  Weather
//
//  Created by Joe Vargas on 8/31/24.
//

import Foundation
import CoreLocation

class PickLocationViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchResults: [SearchedCity] = []
    @Published var storedCities: [SearchedCity] = []
    
    
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
            print("DEBUG: selected city coordinates: \(coordinate)")
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
}

