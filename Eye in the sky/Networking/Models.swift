//
//  Models.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import Foundation
// Data layer model - use for networking

struct WeatherDataNetworkingModel: Codable {
    let name: String
    let weather: [CurrentWeather]
    let main: MainDetails
    let wind: Windy
}

struct CurrentWeather: Codable {
    let main: String
    let icon: String
}

struct MainDetails: Codable {
    let temp: Double
    let humidity: Int
}

struct Windy: Codable {
    let speed: Double
}

// works for ViewModel

struct WeatherUIModel {
    let title: String
    let temp: String
    let description: String
    let humidity: String
    let wind: String
    let icon: String
    
    static func from(title: String = "-", temp: String = "-", description: String = "-", humidity: String = "-", wind: String = "-", icon: String = "") -> WeatherUIModel {
        return WeatherUIModel(title: title,
                              temp: temp,
                              description: description,
                              humidity: humidity,
                              wind: wind,
                              icon: icon)
    }
    
    static func from(model: WeatherDataNetworkingModel) -> WeatherUIModel {
        return WeatherUIModel(title: model.name,
                              temp: String(format: "%.2f", model.main.temp),
                              description: model.weather.first?.main ?? "No description",
                              humidity: String(format: "Humidity: %.2f%%", model.main.humidity),
                              wind: String(format: "Wind: %2.fm/s", model.wind.speed),
                              icon: model.weather.first?.icon ?? "-")
    }
}
