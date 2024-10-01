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

# Get started(important)
In order to get the app to function properly locally on your end, you must register for and apply your own key to the codebase.

Head to [https://www.weatherapi.com/](https://www.weatherapi.com/) to register an account and create your very own key. 

Once you have acquired your key, open the `Network.swift` file found in the `Service` folder. 

Replace `API.Key` with your key as a String type in the following query item: `URLQueryItem(name: key, value: API.Key)`.

Example: if your key is `abcdefg1234567`, the query item should look like `URLQueryItem(name: key, value: "abcdefg1234567")`.

Build and run the app!

If you run into trouble or get stuck, feel free to reach out to me via the email in my [profile](https://github.com/joeavargas). 
