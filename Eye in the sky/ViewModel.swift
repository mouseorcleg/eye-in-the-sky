//
//  ViewModel.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import Foundation

// Data needed by view, when it updates, view updates as well

class WeatherViewModel: ObservableObject {
    @Published var title: String = "Where am I?"
    @Published var temp: String = "Is it cold?"
    @Published var description: String = "Or do I feel cold?"
    @Published var humidity: String = "Am I curly?"
    
    init() {
        fetchWeather()
    }
    
    func fetchWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=51.51&lon=-0.13&appid=cc5f0b417551c77d68956a6336441d72&units=metric") else {
            print("Failed to create a URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, _, error in
            guard let data = data, error == nil
            else {
                print("Couldn't get data from URL")
                return
            }
        
            // Convert data to model
            
            do {
                let model = try JSONDecoder().decode(WeatherDataModel.self, from: data)
                DispatchQueue.main.async {
                    self.title = model.name
                    self.description = model.weather.first?.main ?? "No description"
                    self.temp = "\(model.main.temp)°C"
                    self.humidity = "Humidity: \(model.main.humidity)%"
                }
                
            }
            catch {
                print("failed to decode JSON data")
            }
            
        }
        task.resume()
    }
}
