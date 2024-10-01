//
//  SettingsView.swift
//  Weather
//
//  Created by Joe Vargas on 9/30/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isMetric") private var isMetric: Bool = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                GradientBackgroundView()
                
                Form {
                    Section(header: Text("Units")) {
                        Picker("Units", selection: $isMetric) {
                            Text("°F").tag(false)
                            Text("°C").tag(true)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .listRowBackground(Color.lightNavyBlue)
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SettingsView()
        .colorScheme(.dark)
}
