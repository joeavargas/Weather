//
//  ForecastReportView.swift
//  Weather
//
//  Created by Joe Vargas on 8/21/24.
//

import SwiftUI

struct ForecastReportView: View {
    var body: some View {
        ZStack {
            GradientBackgroundView()
            
            VStack {
                Text("Forecast report")
                    .padding(.bottom)
                
                HStack {
                    Text("Today")
                    Spacer()
                    Text("August 21, 2024")
                }
                
                // ScrollView(horizontal)
                // Array of Hourly Data
                
                HStack {
                    Text("Next Forecast")
                    Spacer()
                    Image(systemName: "calendar")
                }
                
                // ScrollView(vertical)
                // Daily weather
                ScrollView {
                    ForEach(0..<10) { _ in
                        DailyWeatherCardView()
                    }
                }
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
        }
    }
}

#Preview {
    ForecastReportView()
}
