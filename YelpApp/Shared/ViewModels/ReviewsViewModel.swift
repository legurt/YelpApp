//
//  ReviewsViewModel.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 22.11.2022.
//

import SwiftUI

final class ReviewsViewModel: ObservableObject {
    private lazy var apiClient = ApiClient.shared

    @Published var reviews: [ReviewModel] = []
    @Published var isLoadingReviews = true

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
}
