//
//  HourlyViewCard.swift
//  Weather
//
//  Created by Joe Vargas on 8/19/24.
//

import SwiftUI

struct HourlyViewCard: View {
    let hour: Hour
    var body: some View {
        HStack {
            hour.condition.iconImage
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .padding()
            VStack {
                Text(hour.formattedHour)
                Text("\(Int(hour.temperatureF))°")
            }
        }
        .padding()
    }
}

#Preview {
    HourlyViewCard(hour: CurrentWeatherResponse.forecastSample.forecastDay.first!.hour.first!)
}
