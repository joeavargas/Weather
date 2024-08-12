//
//  LocationManager.swift
//  Weather
//
//  Created by Joe Vargas on 8/12/24.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    @Published var authorizationStatus: String? = nil
    
    static let shared = LocationManager()
    
    override init() {
        super.init()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            
        case .notDetermined, .restricted, .denied:
            authorizationStatus = "Please enable Location Services in Settings to see your local weather data"
            /// Set `userLocation` to Apple HQ coordinates
            userLocation = CLLocation(latitude: 37.334606, longitude: -122.009102)
        case .authorizedAlways:
            print("DEBUG: authorization always", #function)
        case .authorizedWhenInUse:
            print("DEBUG: authorization when in use", #function)
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        self.userLocation = location
    }
}
