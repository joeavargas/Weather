//
//  AirQualityCardView.swift
//  Weather
//
//  Created by Joe Vargas on 8/21/24.
//

import SwiftUI

struct AirQualityCardView: View {
    var airQuality: AirQuality

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.lightNavyBlue)
            
            VStack(spacing: 6) {
                if let epaIndex = airQuality.epaIndex {
                    Text("\(epaIndex)")
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                
                Text(airQuality.epaIndexDescription)
                    .font(.headline)
                    .foregroundStyle(airQuality.epaIndexBackgroundColor)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout, body: {
    AirQualityCardView(airQuality: CurrentWeatherResponse.currentWeatherSample.airQuality)
})
