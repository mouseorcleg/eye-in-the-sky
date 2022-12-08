//
//  WeatherDatabase.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/12/2022.
//  Inspired by GRDB async Demo project: https://github.com/groue/GRDB.swift/tree/master/Documentation/DemoApps/GRDBAsyncDemo

import Foundation
import GRDB

struct WeatherDatabase {
    
    init(_ dbWriter: any DatabaseWriter) throws {
        self.dbWriter = dbWriter
        try migrator.migrate(dbWriter)
    }
    
    // Provides access to the database.
    // Application can use a `DatabasePool`, while SwiftUI previews and tests
    // can use a fast in-memory `DatabaseQueue`.
    // See <https://github.com/groue/GRDB.swift/blob/master/README.md#database-connections>
    private let dbWriter: any DatabaseWriter
    
    // defines a db schema
    
    private var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        
#if DEBUG
        // Speed up development by nuking the database when migrations change
        // See <https://swiftpackageindex.com/groue/grdb.swift/documentation/grdb/migrations>
        migrator.eraseDatabaseOnSchemaChange = true
#endif
        
        migrator.registerMigration("createWeather") { db in
            // Create a table
            // See https://github.com/groue/GRDB.swift#create-tables
            try db.create(table: "citiesWeather") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("name", .text).notNull()
                t.column("timezone", .integer)
                t.column("descriotion", .text)
                t.column("icon", .text)
                t.column("temp", .double)
                t.column("humidity", .integer)
                t.column("wind", .double)
            }
        }
        
        // Migrations for future application versions should be inserted here
        
        return migrator
    }
}

// MARK: - Database Access: Writes

extension WeatherDatabase {
    
    // A validation error that prevents weather without city name from being saved into the database.
    
    enum ValidationError: LocalizedError {
        case missingName
        
        var errorDescription: String? {
            switch self {
            case .missingName:
                return "I need a city name to save it"
            }
        }
    }
    
    // Saves (inserts or updates) the weather. When the method returns, the weather is present in the database, and its id is not nil.
    
    func saveWeather(_ weatherDatabase: inout WeatherDataModel) async throws {
        if weatherDatabase.name.isEmpty {
            throw ValidationError.missingName
        }
        weatherDatabase = try await dbWriter.write { [weatherDatabase] db in
            try weatherDatabase.saved(db)
        }
    }
    
}

// MARK: - Database Access: Reads

extension WeatherDatabase {
    /// Provides a read-only access to the database
    var databaseReader: DatabaseReader {
        dbWriter
    }
}

