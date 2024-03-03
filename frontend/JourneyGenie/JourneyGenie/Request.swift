//
//  Request.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 2/3/2024.
//

import Foundation
import MapKit

struct Request: Codable {
    var latitude: Double
    var longitude: Double
    var date: Date
    var formattedDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short // This sets the style of the date
        dateFormatter.timeStyle = .none // This ensures that no time is included in the output

        return dateFormatter.string(from: date)
    }
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
