//
//  AutocompleteDecodableModel.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 14.11.2022.
//

import Foundation

struct AutocompleteDecodableModel: Codable {
    let categories: CategoriesDecodableModel
    let terms: TermsDecodableModel
}

typealias CategoriesDecodableModel = [CategoryDecodableModel]

struct CategoryDecodableModel: Codable {
    let title: String
}

typealias TermsDecodableModel = [TermDecodableModel]

struct TermDecodableModel: Codable {
    let text: String
}
