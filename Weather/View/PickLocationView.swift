//
//  PickLocationView.swift
//  Weather
//
//  Created by Joe Vargas on 8/27/24.
//

import SwiftUI

struct PickLocationView: View {
    let columns = [
        GridItem(.fixed(150)),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            GradientBackgroundView()
            
            VStack {
                VStack {
                    Text("Pick Location")
                        .font(.title)
                        .padding(.bottom)
                    
                    Text("Find the area or city that you want to know the detailed weather info at this time")
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        SearchView()
                        
                        MyLocationButtonView()
                    }
                    .padding([.top, .bottom], 50)
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(0..<5) { _ in
                                LocationCardView()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 22)
            }
        }
    }
}

#Preview {
    PickLocationView()
}
