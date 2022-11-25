//
//  ReviesDecodableModel.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 22.11.2022.
//

import Foundation

struct ReviewsDecodableModel: Codable {
    let reviews: [ReviewDecodableModel]
}

extension ReviewsDecodableModel {
    func toDomain() -> [ReviewModel] {
        return reviews.map { $0.toDomain() }
    }
}

struct ReviewDecodableModel: Codable {
    let id: String
    let rating: Int
    let user: UserDecodableModel
    let text: String
    let time: String
}

extension ReviewDecodableModel {
    enum CodingKeys: String, CodingKey {
        case id
        case rating
        case user
        case text
        case time = "time_created"
    }
}

extension ReviewDecodableModel {
    func toDomain() -> ReviewModel {
        return .init(id: id,
                     rating: rating,
                     name: user.name,
                     text: text,
                     time: time.components(separatedBy: " ")[0])
    }
}

struct UserDecodableModel: Codable {
    let name: String
}
