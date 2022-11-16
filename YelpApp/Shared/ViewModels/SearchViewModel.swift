//
//  SearchViewModel.swift
//  YelpApp
//
//  Created by Leonid Hurtovyi on 16.11.2022.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    @Published var longitude: String = ""
    @Published var latitude: String = ""
    
    func getIpInfo() {
        ApiClient.shared.ipInfoRequest {  [weak self] result in
            guard let self = self else { return }
            switch result {
            case.success(let value):
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
        }
    }
}
