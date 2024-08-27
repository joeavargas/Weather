//
//  MyLocationButtonView.swift
//  Weather
//
//  Created by Joe Vargas on 8/27/24.
//

import SwiftUI

struct MyLocationButtonView: View {
    private let buttonDimension = 50.0
    var body: some View {
        VStack {
            Button {
                print("DEBUG: get location")
            } label: {
                Image(systemName: "location")
                    .resizable()
                    .scaledToFit()
                    .padding(15)
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                            .fill(Color.lightViolet)
                    )
                    .frame(width: buttonDimension, height: buttonDimension)
            }
        }
    }
}

#Preview {
    MyLocationButtonView()
}
