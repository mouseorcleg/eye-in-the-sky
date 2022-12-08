//
//  Eye_in_the_skyApp.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/11/2022.
//

import SwiftUI

@main
struct Eye_in_the_skyApp: App {
    
    var body: some Scene {
        WindowGroup {
            WeatherListView()
                .environmentObject(WeatherRepository(weatherService: WeatherService()))
                .environment(\.weatherDatabase, .shared)
        }
    }
}

// MARK: - Give SwiftUI access to the database
// Define a new environment key that grants access to an WeatherDatabase.
// The technique is documented at
// <https://developer.apple.com/documentation/swiftui/environmentkey>.

private struct WeatherDatabaseKey: EnvironmentKey {
    static var defaultValue: WeatherDatabase { .empty() }
}

extension EnvironmentValues {
    var weatherDatabase: WeatherDatabase {
        get { self[WeatherDatabaseKey.self] }
        set { self[WeatherDatabaseKey.self] = newValue }
    }
}
