//
//  ItinerariesView.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 2/3/2024.
//

import SwiftUI

struct ItinerariesView: View {
    @Binding var itineraries: [Itinerary]
    @Binding var currentTab: Int
    
    var body: some View {
        NavigationStack {
            Group {
                if (itineraries.isEmpty) {
                    ContentUnavailableView {
                        Label("No itineraries", systemImage: "tray")
                    } description: {
                        // Insert copy here
                        Text("")
                    } actions: {
                        Button("Create new itinerary") {
                            currentTab = 0
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    List {
                        ForEach(itineraries) {itinerary in
                            NavigationLink {
                                ItineraryView(itinerary: itinerary)
                            } label: {
                                Text("\(itinerary.location) - \(itinerary.date)")
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
            .navigationTitle("Itineraries")
        }
    }
}
