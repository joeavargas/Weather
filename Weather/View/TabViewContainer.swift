//
//  TabViewContainer.swift
//  Weather
//
//  Created by Joe Vargas on 8/19/24.
//

import SwiftUI
import CoreLocation

struct TabViewContainer: View {
    let location: CLLocation
    var body: some View {
        TabView {
            Home(location: location)
                .tabItem {
                    Label("", systemImage: "house.fill")
                }
            
            Text("SearchView")
                .tabItem {
                    Label("", systemImage: "magnifyingglass")
                }
            
            Text("ForecastReportView")
                .tabItem {
                    Label("", systemImage: "chart.xyaxis.line")
                }
            
            Text("SettingsView")
                .tabItem {
                    Label("", systemImage: "gearshape.fill")
                }
        }
    }
}

#Preview {
    TabViewContainer(location: CLLocation(latitude: 29.749907, longitude: -95.358421))
}
