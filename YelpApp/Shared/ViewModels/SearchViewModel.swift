//
//  SearchViewModel.swift
//  YelpApp
//
//  Created by Leonid Hurtovyi on 16.11.2022.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    private lazy var apiClient = ApiClient.shared
    
    @Published var longitude: String = ""
    @Published var latitude: String = ""
    @Published var locationCollected: Bool = false
    @Published var businesses: [BusinessModel] = []
    
    func getIpInfo() {
        apiClient.ipInfoRequest {  [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let value):
                self.setCoordinates(location: value.loc)
            case .failure(let error):
                print(error)
                return
            }
        }
    }
    
    func setCoordinates(location: String) {
        let coordinates = location.components(separatedBy: ",")
        if coordinates.count >= 2 {
            latitude = coordinates[0]
            longitude = coordinates[1]
            locationCollected = true
        }
    }

    func getGeocodingByLocation(_ location: String) {
        apiClient.getLocationRequest(location: location) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let value):
                if !value.results.isEmpty {
                    self.latitude = String(value.results[0].geometry.location.lat)
                    self.longitude = String(value.results[0].geometry.location.lng)
                    self.locationCollected = true
                }
            case .failure(let error):
                print(error)
                return
            }
        }
    }
    
    func getBusinesses(latitude: String,
                       longitude: String,
                       term: String,
                       distance: String,
                       categories: String) {
        apiClient.getBusinessesRequest(latitude: latitude,
                                       longitude: longitude,
                                       term: term,
                                       radius: convertDistanceToMeters(distance),
                                       categories: categories) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let value):
                var i = 1
                for business in value.businesses {
                    if i > 10 {
                        break
                    }
                    var businessModel = business.toDomain(number: i)
                    businessModel.distance = self.convertDistanceToMiles(businessModel.distance)
                    self.businesses.append(businessModel)
                    i += 1
                }
                case .failure(let error):
                    print(error)
                    return
            }
        }
    }

    func convertDistanceToMeters(_ distance: String) -> String {
        let doubleDistance = Double(distance) ?? 0
        let convertedDistance = doubleDistance * 1609.34
        let intConvertedDistance = Int(convertedDistance)
        return String(intConvertedDistance)
    }

    func convertDistanceToMiles(_ distance: Double) -> Double {
        return distance / 1609.34
    }
}