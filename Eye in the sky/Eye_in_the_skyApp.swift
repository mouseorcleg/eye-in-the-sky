//
//  Eye_in_the_skyApp.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import SwiftUI

@main
struct Eye_in_the_skyApp: App {
    
//    private let weatherService = WeatherService()
//    private let persistenceController = PersistenceController.shared
//    private func getWeatherRepo() -> WeatherRepo {
//        return WeatherRepository(weatherService: weatherService, persistanceController: persistenceController)
//    }
    
    
    
    var body: some Scene {
        WindowGroup {
//            let repo = WeatherRepository(weatherService: WeatherService(), persistanceController: PersistenceController.shared)
            WeatherListView().environmentObject(WeatherRepository(weatherService: WeatherService(), persistanceController: PersistenceController.shared))
        }
    }
}
