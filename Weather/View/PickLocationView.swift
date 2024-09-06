//
//  PickLocationView.swift
//  Weather
//
//  Created by Joe Vargas on 8/27/24.
//

import SwiftUI

struct PickLocationView: View {
    
    @StateObject private var viewModel = PickLocationViewModel()
    
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
                        SearchView(searchText: $viewModel.searchText)
                        
                        MyLocationButtonView()
                    }
                    .padding([.top, .bottom], 50)
                    
                    if viewModel.searchResults.isEmpty {
                        // Display stored cities when there are no search results
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(viewModel.storedCities) { storedCity in
                                    LocationCardView(storedCity: storedCity)
                                }
                            }
                            .padding(.horizontal)
                        }
                    } else {
                        // Display search results
                        List(viewModel.searchResults) { searchResult in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(searchResult.name)
                                        .font(.subheadline)
                                    Text(searchResult.state)
                                        .font(.subheadline)
                                }
                                .foregroundStyle(.black)
                                Spacer()
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                print("DEBUG: \(searchResult)")
                                viewModel.selectedCity(selectedCity: searchResult)
                                viewModel.searchResults.removeAll()
                                viewModel.searchText = ""
                            }
                        }
                        
                    }
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 22)
            }
            .onChange(of: viewModel.searchText) {
                viewModel.searchCity()
            }
        }
        .onAppear {
            viewModel.loadStoredCities()
        }
    }
}

#Preview {
    PickLocationView()
}
