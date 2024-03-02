//
//  ContentView.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 1/3/2024.
//

import SwiftUI
import MapKit

extension String {
    var isInt: Bool {
        Int(self) != nil
    }
}

struct ContentView: View {
    let geocoder = CLGeocoder()
    
    @State private var coordinate: CLLocationCoordinate2D?
    @State private var locationString = ""
    
    var body: some View {
        TextField("Location", text: $locationString)
        
        GlobeView { coordinate in
            print("Map tapped at coordinate: \(coordinate.latitude), \(coordinate.longitude)")
            self.coordinate = coordinate
            reverseGeocode()
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func reverseGeocode() {
        let location = CLLocation(latitude: coordinate!.latitude, longitude: coordinate!.longitude)
        self.geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard error == nil else {
                // Handle failure to retrieve address
                return
            }
            
            guard let placemarks, let placemark = placemarks.first else {
                // Handle no matching address
                return
            }
    
            // Only allow locality or sublocality
            locationString = placemark.name!.isInt ? placemark.locality! : placemark.name!
        }
    }
}

#Preview {
    ContentView()
}
