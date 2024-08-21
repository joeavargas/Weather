//
//  UVCardView.swift
//  Weather
//
//  Created by Joe Vargas on 8/21/24.
//

import SwiftUI

struct UVCardView: View {
    let currentWeather: CurrentWeather
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.lightNavyBlue)
            
            VStack(spacing: 12) {
                Text("\(Int(currentWeather.uv))")
                    .font(.system(size: 100))
                    .foregroundStyle(.white)
                
                Text(currentWeather.uvExposureCategory)
                    .font(.headline)
                    .foregroundStyle(currentWeather.uvExposureCategorColor)
                
                Text(currentWeather.uvDescription)
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    UVCardView(currentWeather: CurrentWeatherResponse.currentWeatherSample)
}
