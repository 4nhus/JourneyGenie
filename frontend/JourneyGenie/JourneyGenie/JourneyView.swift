//
//  JourneyView.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 2/3/2024.
//

import SwiftUI
import MapKit

extension String {
    var isInt: Bool {
        Int(self) != nil
    }
}

struct JourneyView: View {
    let geocoder = CLGeocoder()
    
    @State private var locationString = ""
    // Initialise to either user current location or (0, 0)
    @State private var request = Request(latitude: 0, longitude: 0, date: Date.now)
    @State private var showingItinerary = false
    @Binding var itineraries: [Itinerary]
    @State private var currentItinerary: Itinerary?
    
    var body: some View {
        NavigationStack {
            ZStack {
                GlobeView { coordinate in
                    print("Map tapped at coordinate: \(coordinate.latitude), \(coordinate.longitude)")
                    request.latitude = coordinate.latitude
                    request.longitude = coordinate.longitude
                    reverseGeocode()
                }
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack(spacing: 10) {
                        TextField("Location", text: $locationString)
                        DatePicker("Trip date", selection: $request.date, in: Date.now..., displayedComponents: .date)
                        Button("Grant me an itinerary!") {
                            Task {
                                await sendRequest()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(locationString.isEmpty)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    Spacer()
                }
            }
            .navigationTitle("JourneyGenie")
        }
        .sheet(item: $currentItinerary) { itinerary in
            Text(itinerary.location)
                .font(.title)
                .bold()
                .padding(.top)
            ItineraryView(itinerary: itinerary)
        }
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
            
            locationString = placemark.locality ?? placemark.name!
        }
    }
    
    func sendRequest() async {
        guard let encoded = try? JSONEncoder().encode(request) else {
            // Handle failed encoding
            return
        }
        
        let location = locationString
        let url = URL(string: "http://127.0.0.1:5000/api/v1/journey")!
        var httpRequest = URLRequest(url: url)
        httpRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        httpRequest.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: httpRequest, from: encoded)
            
            let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
            itineraries.append(decodedResponse.convertToItineraryWithLocationAndDate(location: location, date: request.formattedDateString))
            
            // Save itineraries
            let itinerariesData = try JSONEncoder().encode(itineraries)
            try itinerariesData.write(to: ContentView.itinerariesURL, options: [.atomic, .completeFileProtection])
            
            currentItinerary = itineraries.last
        } catch {
            // Handle failed request/response, or failed encoding
        }
    }
}
