//
//  GeocodingDecodableModel.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 17.11.2022.
//

import Foundation

struct GeocodingDecodableModel: Codable {
    let results: [GeocodingResult]
}

struct GeocodingResult: Codable {
    let geometry: GeocodingGeometry
}

struct GeocodingGeometry: Codable {
    let location: GeocodingLocation
}

struct GeocodingLocation: Codable {
    let lat: Double
    let lng: Double
}
