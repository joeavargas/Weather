# Weather
Weather app built with SwiftUI securely using the weatherAPI data endpoint. 

# Get started(important)
In order to get the app to function properly locally on your end, you must register for and apply your own key to the codebase.

Head to [https://www.weatherapi.com/](https://www.weatherapi.com/) to register an account and create your very own key. 

Once you have acquired your key, open the `Network.swift` file found in the `Service` folder. 

Replace `API.Key` with your key as a String type in the following query item: `URLQueryItem(name: key, value: API.Key)`.

Example: if your key is `abcdefg1234567`, the query item should look like `URLQueryItem(name: key, value: "abcdefg1234567")`.

Build and run the app!

If you run into trouble or get stuck, feel free to reach out to me via the email in my [profile](https://github.com/joeavargas). 
