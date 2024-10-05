//
//  LaunchScreenView.swift
//  Weather
//
//  Created by Joe Vargas on 10/1/24.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            GradientBackgroundView()
            
            VStack {
                Text("Welcome To Weather")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}
