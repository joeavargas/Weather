//
//  PickLocationViewModel.swift
//  Weather
//
//  Created by Joe Vargas on 8/31/24.
//

import Foundation

class PickLocationViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchResults: [SearchedCity] = []
    @Published var storedCities: [SearchedCity] = []
    
    
}
