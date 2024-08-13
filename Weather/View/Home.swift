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
        switch LocationManager.shared.authorizationStatus {
        case .denied, .notDetermined, .restricted:
            VStack(spacing: 30) {
                Text("\(location)")
                if let locationAuthStatus = LocationManager.shared.authorizationStatus {
                    Text(locationAuthStatus.rawValue)
                }
            }
            
        default:
            Text("\(location)")
        }
    }
}

#Preview {
    Home(location: CLLocation(latitude: 29.749907, longitude: -95.358421))
}
