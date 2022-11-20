//
//  BusinessesDecodableModel.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 17.11.2022.
//

import Foundation

struct BusinessesDecodableModel: Codable {
    let businesses: [BusinessDecodableModel]
}

struct BusinessDecodableModel: Codable {
    let id: String
    let name: String
    let rating: Double
    let distance: Double
    let imageUrl: String
}

extension BusinessDecodableModel {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case rating
        case distance
        case imageUrl = "image_url"
    }
}

extension BusinessDecodableModel {
    func toDomain(number: Int) -> BusinessModel {
        return .init(id: id,
                     name: name,
                     rating: rating,
                     distance: distance,
                     imageUrl: imageUrl,
                     number: number)
    }
}
