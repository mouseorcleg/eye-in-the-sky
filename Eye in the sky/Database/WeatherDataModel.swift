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
    var timezone: Int
    var descriotion: String
    var icon: String
    var temp: Float
    var humidity: Int
    var wind: Float
    
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
        static let timezone = Column(CodingKeys.timezone)
        static let description = Column(CodingKeys.descriotion)
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

