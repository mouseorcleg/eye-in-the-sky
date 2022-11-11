//
//  Models.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import Foundation

// Data

struct WeatherDataModel: Codable {
    let timezone: Int
    let name: String
    let weather: [CurrentWeather]
    let main: MainDetails
}

struct CurrentWeather: Codable {
    let main: String
}

struct MainDetails: Codable {
    let temp: Float
    let humidity: Int
}
