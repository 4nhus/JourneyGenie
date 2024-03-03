//
//  ContentView.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 1/3/2024.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var itineraries = [Itinerary]()
    
    var body: some View {
        TabView {
            Group {
                JourneyView(itineraries: $itineraries)
                    .tabItem {
                        Label("Journey", systemImage: "airplane.departure")
                    }
                ItinerariesView(itineraries: $itineraries)
                    .tabItem {
                        Label("Itineraries", systemImage: "list.bullet")
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
        .preferredColorScheme(.dark)
    }
    
    
    
}

#Preview {
    ContentView()
}
