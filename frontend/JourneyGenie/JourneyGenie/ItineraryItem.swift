//
//  ItineraryItem.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 2/3/2024.
//

import Foundation

struct ItineraryItem: Codable {
    let start: String
    let end: String
    let description: String
    var title: String {
        return description.split(separator: " - ").map(String.init)[0]
    }
    var details: String {
        description.split(separator: " - ").map(String.init)[1]
    }
}


