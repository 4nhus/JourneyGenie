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
            Section("Morning") {
                ForEach(itinerary.morning, id: \.description) {
                    ItineraryItemView(itineraryItem: $0)
                }
            }
            Section("Afternoon") {
                ForEach(itinerary.afternoon, id: \.description) {
                    ItineraryItemView(itineraryItem: $0)
                }
            }
            Section("Evening") {
                ForEach(itinerary.evening, id: \.description) {
                    ItineraryItemView(itineraryItem: $0)
                }
            }
        }
    }
}
