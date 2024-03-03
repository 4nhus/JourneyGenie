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
    @State private var currentTab = 0
    @Namespace private var namespace
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentTab) {
                JourneyView(itineraries: $itineraries)
                    .tag(0)
                
                ItinerariesView(itineraries: $itineraries, currentTab: $currentTab)
                    .tag(1)
            }
            
            HStack {
                NavigationTabItem(tab: 0) {
                    Label("Journey", systemImage: "airplane.departure")
                }
                NavigationTabItem(tab: 1) {
                    Label("Itineraries", systemImage: "list.bullet")
                }
            }
            .background(.ultraThinMaterial)
        }
        .preferredColorScheme(.dark)
    }
    
    func NavigationTabItem<Label: View>(tab: Int, @ViewBuilder label: () -> Label) -> some View {
        Button {
            currentTab = tab
        } label: {
            VStack {
                if currentTab == tab {
                    label()
                        .bold()
                    Color.white.frame(height: 2)
                        .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                } else {
                    label()
                        .fontWeight(.light)
                    Color.clear.frame(height: 2)
                }
            }
            .padding(.top)
            .animation(.spring(), value: currentTab)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ContentView()
}
