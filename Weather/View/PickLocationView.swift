//
//  PickLocationView.swift
//  Weather
//
//  Created by Joe Vargas on 8/27/24.
//

import SwiftUI

struct PickLocationView: View {
    var body: some View {
        ZStack {
            GradientBackgroundView()
            
            VStack {
                Text("Pick Location")
                    .font(.title)
                    .padding(.bottom)
                
                Text("Find the area or city that you want to know the detailed weather info at this time")
                    .multilineTextAlignment(.center)
            }
            .foregroundStyle(.white)
            .padding(.horizontal, 22)
        }
    }
}

#Preview {
    PickLocationView()
}
