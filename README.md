# Weather
Weather app built with SwiftUI using weatherAPI endpoint. 

# Features
- Fetch weather data from [weatherAPI](https://www.weatherapi.com/) using Concurrency(async/await) paired with [CoreLocation](https://developer.apple.com/documentation/corelocation) framework to access device location coordinates. 
- Use [GeoCoder](https://developer.apple.com/documentation/corelocation/clgeocoder) to search for cities
- Use [SwiftData](https://developer.apple.com/documentation/swiftdata) to save searched cities to model context
  - Parse saved cities from model context and query weather data for each city
  - Display cities and it's respective weather data in `PickLocationView.swift`

# Trello board
View the progress of the app 👉🏼 [https://trello.com/b/W6wJPtJi](https://trello.com/b/W6wJPtJi)
