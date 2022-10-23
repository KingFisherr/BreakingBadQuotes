//
//  Models.swift
//  BreakingBad_iOS
//
//  Created by Tahsin Provath on 9/27/22.
//

import Foundation

// Create struct for quotes
struct Quotes: Codable{
    var quote_id: Int
    var quote: String
    var author: String
}

struct FlightData: Decodable{
    var data: Data
}

struct Data: Decodable{
    var flight_date: String
}
