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
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.lightNavyBlue)
            
            VStack {
                HStack {
                    VStack(spacing: 8) {
                        Text("Friday")
                        Text("May 28")
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    
                    Text("32°")
                        .font(.system(size: 40))
                    
                    Spacer()
                    
                    Image(systemName: "cloud.sun")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                    
                }
                .foregroundStyle(.white)
            .padding()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    DailyWeatherCardView()
}
