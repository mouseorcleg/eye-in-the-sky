//
//  PersistenceController.swift
//  Eye in the sky
//  Credit where credit is due: https://www.hackingwithswift.com/quick-start/swiftui/how-to-configure-core-data-to-work-with-swiftui
//
//  Created by Maria Kharybina on 12/11/2022.
//

import Foundation
import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // Storage for Core Data
    var container = NSPersistentContainer(name: "LocalWeatherData")

    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)

        for _ in 0..<2 {
            let weatherExample = WeatherCoreData(context: controller.container.viewContext)
            
                weatherExample.name = "London"
                weatherExample.temp = 14.0
                weatherExample.timezone = 1
                weatherExample.main = "Not a bad wether"
                weatherExample.icon = " "
                weatherExample.humidity = 2
                weatherExample.speed = 3
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
