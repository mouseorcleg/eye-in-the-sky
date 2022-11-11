//
//  Models.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import Foundation

// Data

struct WeatherDataModel: Codable {
    let timezone: Float
    let name: String
    let weather: [CurrentWeather]
    let main: MainDetails
}

struct CurrentWeather: Codable {
    let description: String
}

struct MainDetails: Codable {
    let temp: Float
}
