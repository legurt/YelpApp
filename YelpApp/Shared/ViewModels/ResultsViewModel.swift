//
//  ResultsViewModel.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 22.11.2022.
//

import Foundation

final class ResultsViewModel: ObservableObject {
    private lazy var apiClient = ApiClient.shared

    @Published var detailedBusiness: DetailedBusinessModel
    @Published var reviews: [ReviewModel]
    @Published var isLoadingReviews: Bool
    
    public init(reviews: [ReviewModel] = [],
                isLoadingReviews: Bool = true,
                detailedBusiness: DetailedBusinessModel = DetailedBusinessModel()) {
        self.reviews = reviews
        self.isLoadingReviews = isLoadingReviews
        self.detailedBusiness = detailedBusiness
    }

    func getReviews(id: String) {
        isLoadingReviews = true
        apiClient.getReviewsRequest(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let value):
                self.reviews = value.reviews.map { $0.toDomain() }
                self.isLoadingReviews = false
            case .failure(let error):
                print(error)
                return
            }
        }
    }

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
