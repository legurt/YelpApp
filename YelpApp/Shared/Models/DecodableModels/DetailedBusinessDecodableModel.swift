//
//  DetailedBusinessDecodableModel.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 22.11.2022.
//

import Foundation

struct DetailedBusinessDecodableModel: Codable {
    let id: String
    let name: String
    let categories: CategoriesDecodableModel?
    let coordinates: CoordinatesDecodableModel?
    let phone: String?
    let hours: HoursDecodableModel?
    let location: LocationDecodableModel?
    let photos: [String]?
    let price: String?
    let url: String?
}

extension DetailedBusinessDecodableModel {
    func toDomain() -> DetailedBusinessModel {
        return .init(id: id,
                     name: name,
                     categories: categories?.toDomain(),
                     coordinates: coordinates?.toDomain(),
                     phone: phone,
                     isOpen: hours?[0].isOpen,
                     address: location?.address,
                     images: photos,
                     price: price,
                     yelpUrl: url)
    }
}

struct CoordinatesDecodableModel: Codable {
    let latitude: Double
    let longitude: Double
}

extension CoordinatesDecodableModel {
    func toDomain() -> CoordinatesModel {
        return .init(lattitude: latitude,
                     longitude: longitude)
    }
}

typealias HoursDecodableModel = [HourDecodableModel]

struct HourDecodableModel: Codable {
    let isOpen: Bool
}

extension HourDecodableModel {
    enum CodingKeys: String, CodingKey {
        case isOpen = "is_open_now"
    }
}

struct LocationDecodableModel: Codable {
    let address: [String]
}

extension LocationDecodableModel {
    enum CodingKeys: String, CodingKey {
        case address = "display_address"
    }
}
