//
//  PersistenceController.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 12/11/2022.
//

import Foundation
import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // Storage for Core Data
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)

        // Create 10 example programming languages.
        for _ in 0..<10 {
            let wetherTheWeather = WeatherData(context: controller.container.viewContext)
            wetherTheWeather.title = "London"
            wetherTheWeather.temp = "+ 14"
        }

        return controller
    }()

    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    
    init(inMemory: Bool = false) {
        
        container = NSPersistentContainer(name: "LocalWeatherData")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
                print("Can't save changes to CoreData. Ooops!")
            }
        }
    }
}
