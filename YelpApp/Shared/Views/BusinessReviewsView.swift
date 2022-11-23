//
//  BusinessReviewsView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 22.11.2022.
//

import SwiftUI

struct BusinessReviewsView: View {

    @ObservedObject var viewModel = ReviewsViewModel()
    var businessId: String

    var body: some View {
        if viewModel.isLoadingReviews {
            VStack {
                ProgressView()
                Text("Please wait...")
            }
            .onAppear {
                viewModel.getReviews(id: businessId)
            }
        } else {
            List(viewModel.reviews) { review in
                ReviewRow(review: review)
            }
        }
    }
}

struct ReviewRow: View {
    var review: ReviewModel
    
    var body: some View {
        Text(review.name)
    }
}
