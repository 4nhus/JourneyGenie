//
//  ItineraryView.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 2/3/2024.
//

import SwiftUI

struct ItineraryView: View {
    let itinerary: Itinerary
    
    var body: some View {
        List {
            // Change format and refactor duplication
            Section("Morning") {
                ForEach(itinerary.morning, id: \.description) { itineraryItem in
                    Text("Start: \(itineraryItem.start)")
                    Text("End: \(itineraryItem.end)")
                    Text("Description: \(itineraryItem.description)")
                }
            }
            Section("Afternoon") {
                ForEach(itinerary.afternoon, id: \.description) { itineraryItem in
                    Text("Start: \(itineraryItem.start)")
                    Text("End: \(itineraryItem.end)")
                    Text("Description: \(itineraryItem.description)")
                }
            }
            Section("Evening") {
                ForEach(itinerary.evening, id: \.description) { itineraryItem in
                    Text("Start: \(itineraryItem.start)")
                    Text("End: \(itineraryItem.end)")
                    Text("Description: \(itineraryItem.description)")
                }
            }
        }
    }
}
