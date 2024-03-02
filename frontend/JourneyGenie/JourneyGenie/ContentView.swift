//
//  ContentView.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 1/3/2024.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let geocoder = CLGeocoder()
    
    @State private var locationString = ""
    // Initialise to either user current location or (0, 0)
    @State private var request = Request(latitude: 0, longitude: 0, date: Date.now)
    @State private var itineraries = [Itinerary]()
    
    var body: some View {
        TabView {
            JourneyView(itineraries: $itineraries)
                .tabItem {
                    Label("Journey", systemImage: "airplane.departure")
                }
            ItinerariesView(itineraries: $itineraries)
                .tabItem {
                    Label("Itineraries", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    ContentView()
}
