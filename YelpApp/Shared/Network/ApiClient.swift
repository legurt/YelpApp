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

    func autocompleteOptionsRequest(text: String,
                                    completion: @escaping NetworkClosure<AutocompleteDecodableModel>) {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "text", value: text))
        networkClient.getApiRequest(url: NetworkConstants.baseHost + Endpoint.autocomplete,
                                    params: queryItems,
                                    headers: [:],
                                    completion: completion)
    }

    func ipInfoRequest(completion: @escaping NetworkClosure<IpInfoDecodableModel>) {
        networkClient.getApiRequest(url: NetworkConstants.ipInfoHost + NetworkConstants.ipInfoToken,
                                    params: [],
                                    headers: [:],
                                    completion: completion)
    }

    func getLocationRequest(location: String,
                            completion: @escaping NetworkClosure<GeocodingDecodableModel>) {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "address", value: location))
        networkClient.getApiRequest(url: NetworkConstants.baseHost + Endpoint.geocoding,
                                    params: queryItems,
                                    headers: [:],
                                    completion: completion)
    }
    
    func getBusinessesRequest(latitude: String,
                              longitude: String,
                              term: String,
                              radius: String,
                              categories: String,
                              completion: @escaping NetworkClosure<BusinessesDecodableModel>) {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "latitude", value: latitude))
        queryItems.append(URLQueryItem(name: "longitude", value: longitude))
        queryItems.append(URLQueryItem(name: "term", value: term))
        queryItems.append(URLQueryItem(name: "radius", value: radius))
        queryItems.append(URLQueryItem(name: "categories", value: categories))
        networkClient.getApiRequest(url: NetworkConstants.baseHost + Endpoint.businesses,
                                    params: queryItems,
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
