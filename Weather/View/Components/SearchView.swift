//
//  SearchView.swift
//  Weather
//
//  Created by Joe Vargas on 8/27/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.lightViolet)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 14, height: 14)
                
                TextField("", text: $searchText)
                    .placeholder(when: searchText.isEmpty) {
                        Text("Search").foregroundStyle(Color.gray)
                    }
            }
            .foregroundStyle(.white)
            .padding()
        }
        .frame(height: 20)
    }
}

#Preview {
    SearchView(searchText: .constant("Houston"))
}
