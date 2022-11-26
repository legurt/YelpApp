//
//  Location.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 26.11.2022.
//

import Foundation
import MapKit

struct IdentifiableLocation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
