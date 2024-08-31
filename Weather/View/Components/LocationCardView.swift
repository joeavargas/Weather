//
//  LocationCardView.swift
//  Weather
//
//  Created by Joe Vargas on 8/27/24.
//

import SwiftUI

struct LocationCardView: View {
    private let imageDimensions = 40.0
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.aquaBlue)
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 24) {
                        VStack(alignment: .leading) {
                            Text("32")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Cloudy")
                                .foregroundStyle(.secondary)
                        }
                        
                        Image(systemName: "cloud.sun")
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageDimensions, height: imageDimensions)
                    }
                    
                    Text("California")
                        .foregroundStyle(.white)
                }
                .padding()
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    LocationCardView()
}