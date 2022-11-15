//
//  ApiClient.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 14.11.2022.
//

import Foundation

final class ApiClient {

    public static var shared = ApiClient()

    private lazy var networkClient = NetworkClient.shared
    
    public init() {}

    func autocompleteOptionsRequest(completion: @escaping NetworkClosure<AutocompleteDecodableModel>) {
        networkClient.getApiRequest(url: Endpoint.autocomplete,
                                    params: [],
                                    headers: [:],
                                    completion: completion)
    }
}

private enum Endpoint {
    static let autocomplete: String = "/api/autocomplete"
    static let geocoding: String = "/api/geocoding"
    static let businesses: String = "/api/businesses/search"
    static let detailedBusiness: String = "/api/businesses/"
    static let reviews: String = "/api/reviews/"
}
