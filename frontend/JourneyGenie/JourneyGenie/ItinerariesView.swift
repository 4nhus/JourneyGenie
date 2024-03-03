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
            if (itineraries.isEmpty) {
                ContentUnavailableView {
                    Label("List of itineraries empty", systemImage: "tray")
                } actions: {
                    Button("Create a new itinerary") {
                        // Change tab in tabview
                    }
                    .buttonStyle(.borderedProminent)
                }
            } else {
                List {
                    ForEach(itineraries) {itinerary in
                        NavigationLink {
                            ItineraryView(itinerary: itinerary)
                        } label: {
                            Text("Itinerary")
                        }
                    }
                    .onDelete(perform: { indexSet in
                        itineraries.remove(atOffsets: indexSet)
                    })
                }
                .toolbar {
                    EditButton()
                }
            }
        }
    }
}
