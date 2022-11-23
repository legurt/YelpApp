//
//  ReviewDecodableModel.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 22.11.2022.
//

import Foundation

struct ReviewModel: Identifiable {
    var id: String
    var rating: Int
    var name: String
    var text: String
    var time: String
}
