//
//  Itinerary.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 2/3/2024.
//

import Foundation

struct Itinerary: Identifiable, Codable {
    var id = UUID()
    let morning: [ItineraryItem]
    let afternoon: [ItineraryItem]
    let evening: [ItineraryItem]
    let location: String
    let date: String
}
