//
//  DailyWeatherCardView.swift
//  Weather
//
//  Created by Joe Vargas on 8/21/24.
//

import SwiftUI

struct DailyWeatherCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.lightNavyBlue)
            
            HStack {
                VStack {
                    Text("Friday")
                    Text("May 28")
                }
                Spacer()
                
                Text("32°")
                    .font(.title)
                
                Spacer()
                
                Image(systemName: "cloud.sun")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    DailyWeatherCardView()
}
