//
//  BusinessModel.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 17.11.2022.
//

import Foundation

struct BusinessModel: Identifiable {
    var id: String
    var name: String
    var rating: Double
    var distance: Double
    var imageUrl: String
    var number: Int
}
