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
    var timestamp: Int64
    
    static func createDataModel(name: String, description: String, temp: Double, humidity: Int, wind: Double, icon: String) -> WeatherDataModel {
        return WeatherDataModel(name: name,
                                description: description,
                                temp: temp,
                                humidity: humidity,
                                wind: wind,
                                icon: icon,
                                timestamp: Int64(NSDate().timeIntervalSince1970))
    }
    
    static func createDataModel(model: WeatherDataNetworkingModel) -> WeatherDataModel {
        return WeatherDataModel(name: model.name,
                                description: model.weather.first?.main ?? "No description",
                                temp: model.main.temp,
                                humidity: model.main.humidity,
                                wind: model.wind.speed,
                                icon: model.weather.first?.icon ?? "-",
                                timestamp: Int64(NSDate().timeIntervalSince1970))
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
        static let timestamp = Column(CodingKeys.timestamp)
    }
    
    /// Updates a player id after it has been inserted in the database.
    mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }
}

