//
//  GlobeView.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 1/3/2024.
//

import MapKit
import SwiftUI

struct GlobeView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        // For globe view
        mapView.mapType = .hybridFlyover
        
        // Set the initial camera for the globe overview
        let coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let camera = MKMapCamera(lookingAtCenter: coordinate, fromDistance: CLLocationDistanceMax, pitch: 0, heading: 0)
        mapView.camera = camera
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
}

#Preview {
    GlobeView()
}
