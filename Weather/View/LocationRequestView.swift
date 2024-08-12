//
//  LocationRequestView.swift
//  Weather
//
//  Created by Joe Vargas on 8/12/24.
//

import SwiftUI

struct LocationRequestView: View {
    var body: some View {
        ZStack {
            Image("lightning-bg")
                .resizable()
                .scaledToFill()
                .blur(radius: 2)
                .brightness(-0.1)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image(systemName: "paperplane.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 32)
                
                Text("Weather uses your location data to provide the most accurate weather conditions")
                    .font(.system(size: 28, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .frame(width: UIScreen.main.bounds.width)
                    .padding()
                
                Text("Start sharing your location")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
//                    .frame(width: 140)
                    .padding()
                
                Spacer()
                
                VStack {
                    Button {
                        LocationManager.shared.requestLocation()
                    } label: {
                        Text("Allow location")
                            .font(.headline)
                            .foregroundStyle(Color(.systemBlue))
                            .padding()
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.horizontal, -32)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding()
                    
                    Button {
                        // TODO: Dismiss to
                        print("DEBUG: Dismiss")
                    } label: {
                        Text("Maybe later")
                            .padding()
                            .font(.headline)
                            .foregroundStyle(Color.white)
                    }
                }
                .padding(.bottom, 32)
            }
            .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    LocationRequestView()
}
