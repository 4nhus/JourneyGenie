//
//  ContentView.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 1/3/2024.
//

import MapKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        GlobeView()
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
