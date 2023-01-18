//
//  ViewModel.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import Foundation

// Data needed by view, when it updates, view updates as well
extension CellListView {
    @MainActor class WeatherViewModel: ObservableObject {
        @Published var title: String = "London"
        @Published var temp: String = "-2C"
        @Published var description: String = "Cold. It's Cold"
        @Published var humidity: String = "Hymidity: 80%"
        @Published var wind: String = "Wind: 20 m/h"
        @Published var icon: String = ""
        //add stale: Bool
        //if stale show in gray
        
        private let city: String
        private let repo: WeatherRepository
        
        init(city: String, repo: WeatherRepository) {
            self.city = city
            self.repo = repo
        }
        
        func fetchWeatherUI() async {
            let superCity = self.city
            
            let result = await repo.fetchWeatherFromRepo(city: superCity)
            switch (result) {
            case .failure(let error) : print("error: " + error.message)
            case .success(let model) :
                self.title = model.title
                self.temp = model.temp
                self.description = model.description
                self.humidity = model.humidity
                self.wind = model.wind
                self.icon = model.icon
            }
        }
    }
}

class WeatherListViewModel: ObservableObject {
    // city list - 10 items as field
    let cityList: Array<String> = ["Amsterdam", "Athens", "Bern", "Dublin", "Helsinki", "Lisbon", "London", "Rome", "Vienna", "Paris", "Prague", "Oslo", "Madrid", "Reykjavík", "Stockholm‎", "Brussels‎"]
    
}
        
        //there will 2 options:
        //1) success that can be fresh or stale
        //2) error that will show city name and all other fields in darker gray


