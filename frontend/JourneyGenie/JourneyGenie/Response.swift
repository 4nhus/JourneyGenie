//
//  Response.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 2/3/2024.
//

import Foundation

struct Response: Codable {
    let morning: [ItineraryItem]
    let afternoon: [ItineraryItem]
    let evening: [ItineraryItem]
    
    func convertToItinerary() -> Itinerary {
        Itinerary(morning: morning, afternoon: afternoon, evening: evening)
    }
}
