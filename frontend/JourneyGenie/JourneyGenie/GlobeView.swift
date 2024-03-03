//
//  GlobeView.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 1/3/2024.
//

import MapKit
import SwiftUI

class Coordinator: NSObject, MKMapViewDelegate {
    var parent: GlobeView
    
    init(_ parent: GlobeView) {
        self.parent = parent
    }
    
    @objc func mapTapped(_ recognizer: UITapGestureRecognizer) {
        let location = recognizer.location(in: recognizer.view as? MKMapView)
        if let mapView = recognizer.view as? MKMapView {
            let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            parent.annotations.removeAll()
            parent.annotations.append(annotation)
            parent.onTap(coordinate)
        }
    }
    
    // Custom annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "CustomAnnotation"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        
        (annotationView as? MKMarkerAnnotationView)?.glyphTintColor = .white
        (annotationView as? MKMarkerAnnotationView)?.markerTintColor = .systemBlue
        (annotationView as? MKMarkerAnnotationView)?.glyphImage = UIImage(systemName: "airplane.departure")
        
        return annotationView
    }
}

struct GlobeView: UIViewRepresentable {
    @Binding var annotations: [MKPointAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        // For globe view
        mapView.mapType = .hybridFlyover
        
        // Set the initial camera for the globe overview
        let coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let camera = MKMapCamera(lookingAtCenter: coordinate, fromDistance: CLLocationDistanceMax, pitch: 0, heading: 0)
        mapView.camera = camera
        
        let tapRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.mapTapped(_:)))
        mapView.addGestureRecognizer(tapRecognizer)
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(annotations)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Closure to use coordinates from map tap
    var onTap: (CLLocationCoordinate2D) -> Void
}
