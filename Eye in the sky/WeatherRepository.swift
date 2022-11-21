//
//  WeatherRepository.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 21/11/2022.
//

import Foundation

protocol WeatherRepo {
    func fetchWeather(city: String, completion: @escaping (Result<WeatherUIModel, WeatherError>) -> Void)
}

class WeatherRepository: WeatherRepo {
    private let weatherService: WeatherService
    private let persistanceController: PersistenceController
    
    init(weatherService: WeatherService, persistanceController: PersistenceController) {
        self.weatherService = weatherService
        self.persistanceController = persistanceController
    }
    
    func fetchWeather(city: String, completion: @escaping (Result<WeatherUIModel, WeatherError>) -> Void) {
        weatherService.fetchWeather(city: city) { result in
            switch (result) {
            case .success(let model):
                let uiModel = WeatherUIModel.createUiModel(
                    title: model.name,
                    temp: "\(model.main.temp)°",
                    description: model.weather.first?.main ?? "No description"
                )
                
                //save to coredata; if there is an entry, rewrite it
                
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
