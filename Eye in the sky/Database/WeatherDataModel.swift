//
//  WeatherDataModel.swift
//  Eye in the sky
//
//  Created by Maria Kharybina on 08/12/2022.
//

import Foundation
import GRDB

// works for db

struct WeatherDataModel: Identifiable, Equatable {
    var id: Int64?
    
    var name: String
    var description: String
    var temp: Double
    var humidity: Int
    var wind: Double
    var icon: String
    
    static func createDataModel(name: String, description: String, temp: Double, humidity: Int, wind: Double, icon: String) -> WeatherDataModel {
        return WeatherDataModel(name: name,
                                description: description,
                                temp: temp,
                                humidity: humidity,
                                wind: wind,
                                icon: icon)
    }
}

//extension WeatherDataModel {
//    static func new() -> WeatherDataModel {
//        WeatherDataModel(id: nil, name: "")
//    }
//}

// MARK: - Persistence

// Making WDM a Codable Record.
/// See <https://github.com/groue/GRDB.swift/blob/master/README.md#records>

extension WeatherDataModel: Codable, FetchableRecord, MutablePersistableRecord {
    // Define database columns from CodingKeys
    fileprivate enum Columns {
        static let name = Column(CodingKeys.name)
        static let description = Column(CodingKeys.description)
        static let icon = Column(CodingKeys.icon)
        static let temp = Column(CodingKeys.temp)
        static let humidity = Column(CodingKeys.humidity)
        static let wind = Column(CodingKeys.wind)
    }
    
    /// Updates a player id after it has been inserted in the database.
    mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }
}

