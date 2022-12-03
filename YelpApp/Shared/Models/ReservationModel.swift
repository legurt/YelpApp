//
//  ReservationModel.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 02.12.2022.
//

import Foundation

struct ReservationModel: Identifiable, Hashable, Codable {
    var id = UUID()
    var businessName: String
    var date: String
    var time: String
    var email: String
}
