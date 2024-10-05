//
//  GradientBackgroundView.swift
//  Weather
//
//  Created by Joe Vargas on 8/21/24.
//

import SwiftUI

struct GradientBackgroundView: View {
    var body: some View {
        LinearGradient(colors: [Color.aquaBlue, Color.navyBlue],
                       startPoint: UnitPoint(x: 20, y: -5.0),
                       endPoint: .bottomLeading)
        .ignoresSafeArea()
    }
}

#Preview {
    GradientBackgroundView()
}
