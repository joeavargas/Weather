//
//  LocationManager.swift
//  Weather
//
//  Created by Joe Vargas on 8/12/24.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var location: CLLocation?
    @Published var authorizationStatus: LocationAuthStatus? = .none
    
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

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
            
        case .notDetermined:
            authorizationStatus = .notDetermined
            print("DEBUG: \(String(describing: authorizationStatus?.rawValue))")
        case .restricted:
            authorizationStatus = .restricted
            print("DEBUG: \(String(describing: authorizationStatus?.rawValue))")
        case .denied:
            authorizationStatus = .denied
            location = Locations.appleHeadquarters
            print("DEBUG: \(String(describing: authorizationStatus?.rawValue))")
        case .authorizedWhenInUse, .authorizedAlways:
            break

        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        self.location = location
    }
}

enum LocationAuthStatus: String, CaseIterable {
    case authorizedWhenInUse, authorizedAlways
    case notDetermined = "Location status not determined. Please enabled Location Services in Settings to view local weather data"
    case restricted = "Location status restricted. Please enabled Location Services in Settings to view local weather data"
    case denied = "Location status denied. Please enabled Location Services in Settings to view local weather data"
}
