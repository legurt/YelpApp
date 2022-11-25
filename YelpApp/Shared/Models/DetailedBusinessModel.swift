//
//  DetailedBusinessModel.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 22.11.2022.
//

import Foundation

struct DetailedBusinessModel {
    var id: String?
    var name: String?
    var categories: String?
    var coordinates: CoordinatesModel?
    var phone: String?
    var isOpen: Bool?
    var address: String?
    var images: [String]?
    var price: String?
    var yelpUrl: String?
}

struct CoordinatesModel {
    var lattitude: Double
    var longitude: Double
}
