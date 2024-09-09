//
//  SearchedCity.swift
//  Weather
//
//  Created by Joe Vargas on 8/31/24.
//

import Foundation

struct SearchedCity: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var state: String
    var latitude: Double?
    var longitude: Double?
}
