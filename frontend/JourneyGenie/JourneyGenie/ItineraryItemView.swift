//
//  ItineraryItemView.swift
//  JourneyGenie
//
//  Created by Anh Nguyen on 3/3/2024.
//

import SwiftUI

struct ItineraryItemView: View {
    let itineraryItem: ItineraryItem
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(itineraryItem.title)
                .font(.headline)
            Text("\(itineraryItem.start) - \(itineraryItem.end)")
                .font(.subheadline)
                .padding(.bottom)
            Text(itineraryItem.details)
        }
        .padding(.vertical)
    }
}
