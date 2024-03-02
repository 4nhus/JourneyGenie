//
//  Response.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 2/3/2024.
//

import Foundation

struct Response: Codable {
    let morning: [String]
    let afternoon: [String]
    let evening: [String]
}
