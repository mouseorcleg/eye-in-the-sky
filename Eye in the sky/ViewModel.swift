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
    @Published var timeZone: String = "What time is it?"
    
    init() {
        fetchWeather()
    }
    
    func fetchWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=51.51&lon=-0.13&appid=cc5f0b417551c77d68956a6336441d72") else {
            print("Failed to create a URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Couldn't get data from URL")
                return
            }
            
        }
        task.resume()
    }
}
