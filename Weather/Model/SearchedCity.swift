//
//  SearchedCity.swift
//  Weather
//
//  Created by Joe Vargas on 8/31/24.
//

import Foundation
import SwiftData

/// `Step 4`, conform this to stored model managed by SwiftData
@Model
class SearchedCity: Identifiable {
    /// `@Attributed(.unique)` ensures the `name` property is unique amongst stored elements
    @Attribute(.unique) var id: UUID
    var name: String
    var state: String
    var latitude: Double?
    var longitude: Double?
    
    /// `Every SwiftData model needs to be init'd`
    init(id: UUID = UUID(), name: String, state: String, latitude: Double? = nil, longitude: Double? = nil) {
        self.id = id
        self.name = name
        self.state = state
        self.latitude = latitude
        self.longitude = longitude
    }
}
