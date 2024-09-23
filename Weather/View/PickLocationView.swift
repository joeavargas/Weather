//
//  PickLocationView.swift
//  Weather
//
//  Created by Joe Vargas on 8/27/24.
//

import SwiftUI
import SwiftData

struct PickLocationView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel: PickLocationViewModel
    
    init(modelContext: ModelContext) {
        _viewModel = StateObject(wrappedValue: PickLocationViewModel(modelContext: modelContext))
    }
    
    private let columns = [
        GridItem(.flexible()),
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
                        if viewModel.isLoading {
                            ProgressView()
                        } else {
                            ScrollView {
                                LazyVGrid(columns: columns, spacing: 20) {
                                    ForEach(viewModel.storedCityWeatherData, id: \.id) { storedCity in
                                        LocationCardView(storedCityWeatherData: storedCity)
                                            .contextMenu {
                                                Button(role: .destructive) {
                                                    viewModel.deleteCity(storedCity)
                                                } label: {
                                                    Label("Delete", systemImage: "trash")
                                                }
                                            }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    } else {
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
                                viewModel.getCoordinatesAndSaveCity(for: searchResult)
                                viewModel.searchResults.removeAll()
                                viewModel.searchText = ""
                            }
                        }
                    }
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 22)
            }
        }
        .onAppear {
            Task {
                await viewModel.loadWeatherDataForEachCity()
                viewModel.printAllCities()
            }
        }
        .alert(item: $viewModel.errorMessage) { error in
            Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    PickLocationView(modelContext: ModelContext(try! ModelContainer(for: SearchedCity.self)))
}
