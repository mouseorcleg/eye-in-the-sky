//
//  Eye_in_the_skyApp.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import SwiftUI

@main
struct Eye_in_the_skyApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup<WeatherListView> {
            WeatherListView()
        }
    }
}
