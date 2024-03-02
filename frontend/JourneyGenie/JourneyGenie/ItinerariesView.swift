//
//  ItinerariesView.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 2/3/2024.
//

import SwiftUI

struct ItinerariesView: View {
    @Binding var itineraries: [Itinerary]
    
    var body: some View {
        NavigationStack {
            List(itineraries) { itinerary in
                NavigationLink {
                    ItineraryView(itinerary: itinerary)
                } label: {
                    Text("Itinerary")
                }
            }
        }
    }
}
