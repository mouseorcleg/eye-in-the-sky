//
//  WeatherRepository.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 21/11/2022.
//

import Foundation
import GRDB

protocol WeatherRepo {
    func fetchWeatherFromRepo(city: String, completion: @escaping (Result<WeatherUIModel, WeatherError>) -> Void)
}

class WeatherRepository: ObservableObject, WeatherRepo {
    private let weatherService: WeatherService
//    private let persistanceController: PersistenceController
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    func fetchWeatherFromRepo(city: String, completion: @escaping (Result<WeatherUIModel, WeatherError>) -> Void) {
        weatherService.updateWeather(city: city) { result in
            switch (result) {
            case .success(let model):
                let uiModel = WeatherUIModel.createUiModel(
                    title: model.name,
                    temp: "\(model.main.temp)°C",
                    description: model.weather.first?.main ?? "No description",
                    humidity: "Humidity: \(model.main.humidity)%",
                    wind: "Wind: \(model.wind.speed) m/s",
                    icon: model.weather.first?.icon ?? "-"
                )
                
                //save to db; if there is an entry, rewrite it
                
                var dbModel: WeatherDataModel = WeatherDataModel.createDataModel(
                    name: model.name,
                    description: model.weather.first?.main ?? "No descriprion",
                    temp: Double(model.main.temp),
                    humidity: model.main.humidity,
                    wind: Double(model.wind.speed),
                    icon: model.weather.first?.icon ?? "-"
                )
                
                WeatherDatabase.saveWeather(dbModel)
                
                
                
                completion(.success(uiModel))
            case .failure(let error):
                print("hehe")
                //if there is an entry in coredata with the same city name, return it
                //if there is no entry in coredata, return an error
//                completion(error)
            }
        }
    }
}
