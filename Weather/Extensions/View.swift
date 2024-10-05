//
//  View.swift
//  Weather
//
//  Created by Joe Vargas on 8/27/24.
//

import SwiftUI

extension View {
    func placeholder<Content: View> (
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1: 0)
                self
            }
        }
}
