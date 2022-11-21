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