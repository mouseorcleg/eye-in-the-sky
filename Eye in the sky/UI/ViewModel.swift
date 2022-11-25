//
//  ViewModel.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import Foundation

// Data needed by view, when it updates, view updates as well

class WeatherViewModel: ObservableObject {
    @Published var title: String = "-"
    @Published var temp: String = "-"
    @Published var description: String = "-"
    @Published var humidity: String = "-"
    @Published var wind: String = "-"
    @Published var icon: String = ""
    //add stale: Bool
    //if stale show in gray
    
    private let city: String
    private let repo: WeatherRepo
    
    init(city: String, repo: WeatherRepo) {
        self.city = city
        self.repo = repo
        fetchWeatherUI()
    }
    
    private func fetchWeatherUI() {
        let superCity = self.city
        let repo2 = repo
        DispatchQueue.main.async {
            repo2.fetchWeather(city: superCity) { result in
                switch result {
                case .success(let model):
                    self.title = model.title
                    self.temp = model.temp
                    self.description = model.description
                    self.humidity = model.humidity
                    self.wind = model.wind
                    self.icon = model.icon
                    
                case .failure(let error):
                    print("hehe")
                }
            
            }
        }
        
        
        //there will 2 options:
        //1) success that can be fresh or stale
        //2) error that will show city name and all other fields in darker gray
        
    
    }
}
