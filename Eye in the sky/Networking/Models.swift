//
//  Models.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import Foundation

// Data layer model - use for networking + mb Core Data

struct WeatherDataModel: Codable {
    let timezone: Int
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
    let temp: Float
    let humidity: Int
}

struct Windy: Codable {
    let speed: Float
}

// works for ViewModel

struct WeatherUIModel {
    let title: String
    let temp: String
    let description: String
    let humidity: String
    let wind: String
    let icon: String
    
    static func createUiModel(title: String = "-", temp: String = "-", description: String = "-", humidity: String = "-", wind: String = "-", icon: String = "") -> WeatherUIModel {
        return WeatherUIModel(title: title,
                              temp: temp,
                              description: description,
                              humidity: humidity,
                              wind: wind,
                              icon: icon)
    }
}
