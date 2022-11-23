//
//  ResultsViewModel.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 22.11.2022.
//

import Foundation

final class ResultsViewModel: ObservableObject {
    private lazy var apiClient = ApiClient.shared

    @Published var detailedBusiness = DetailedBusinessModel()

    func getDetailedBusiness(id: String) {
        apiClient.getDetailedBusinessRequest(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let value):
                self.detailedBusiness = value.toDomain()
            case .failure(let error):
                print(error)
                return
            }
        }
    }
}
