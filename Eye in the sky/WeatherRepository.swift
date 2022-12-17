//
//  WeatherRepository.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 21/11/2022.
//

import Foundation
import GRDB

protocol WeatherRepo {
    func fetchWeatherFromRepo(city: String) async -> Result<WeatherUIModel, WeatherError>
}

class WeatherRepository: ObservableObject, WeatherRepo {
    
    static let cityList: Array<String> = ["Amsterdam", "Athens", "Bern", "Dublin", "Helsinki", "Lisbon", "London", "Rome", "Vienna", "Paris", "Prague", "Oslo", "Madrid", "Reykjavík", "Stockholm", "Brussels"]
    
    private let weatherService: WeatherService
    private let persistanceController: WeatherDatabase
    
    init(weatherService: WeatherService, persistanceController: WeatherDatabase) {
        self.weatherService = weatherService
        self.persistanceController = persistanceController
    }
    
    func fetchWeatherFromRepo(city: String) async -> Result<WeatherUIModel, WeatherError> {
        let result = await weatherService.updateWeather(city: city)
        switch result {
        case .failure(let error): return .failure(error)
            //if there is an entry in db with the same city name, return it
            //if there is no entry in db, return an error
        case .success(let model):
            persistanceController.saveWeather(
            return .success(WeatherUIModel.from(model: model))
            //save to db, if there is an entry, rewrite it
        }
    }
}
