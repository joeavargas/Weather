//
//  Network.swift
//  Weather
//
//  Created by Joe Vargas on 8/10/24.
//

import Foundation

class Network {
    
    private let shared = URLSession.shared
    
    func fetch<T: Decodable>(lat: Double, lon: Double, type: T.Type) async throws -> T {
        var urlComponents = URLComponents(string: "https://api.weatherapi.com/v1/forecast.json")!
        let coordinates = "\(lat)" + "," + "\(lon)"
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: "ab1e1ff4488543e8925141822240908"),
            URLQueryItem(name: "q", value: coordinates),
            URLQueryItem(name: "days", value: "8"),
            URLQueryItem(name: "aqi", value: "yes")
        ]
        
        let url = urlComponents.url!
        
        let (data, _) = try await shared.data(from: url)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        
        print("DEBUG: decoded data: \(decodedData)")
        return decodedData
    }
    
}
