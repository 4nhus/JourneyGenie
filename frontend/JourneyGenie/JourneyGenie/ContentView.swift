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
    
    @State private var locationString = ""
    // Initialise to either user current location or (0, 0)
    @State private var request = Request(latitude: 0, longitude: 0, date: Date.now)
    @State private var responses = [Response]()
    
    var body: some View {
        VStack {
            TextField("Location", text: $locationString)
            DatePicker("Trip date", selection: $request.date, in: Date.now..., displayedComponents: .date)
            Button("Plan my trip!") {
                Task {
                    await sendRequest()
                }
            }
        }
        
        GlobeView { coordinate in
            print("Map tapped at coordinate: \(coordinate.latitude), \(coordinate.longitude)")
            request.latitude = coordinate.latitude
            request.longitude = coordinate.longitude
            reverseGeocode()
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func reverseGeocode() {
        let location = CLLocation(latitude: request.latitude, longitude: request.longitude)
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
    
    func sendRequest() async {
        guard let encoded = try? JSONEncoder().encode(request) else {
            // Handle failed encoding
            return
        }
        
        let url = URL(string: "http://127.0.0.1:5000")!
        var httpRequest = URLRequest(url: url)
        httpRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        httpRequest.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: httpRequest, from: encoded)
            
            let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
            responses.append(decodedResponse)
            print(decodedResponse)
        } catch {
            // Handle failed request/response
        }
    }
}

#Preview {
    ContentView()
}
