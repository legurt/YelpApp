//
//  BusinessReviewsView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 22.11.2022.
//

import SwiftUI

struct BusinessReviewsView: View {

    @ObservedObject var viewModel: ResultsViewModel

    var body: some View {
        if viewModel.isLoadingReviews {
            CustomProgressView()
        } else {
            VStack {
                List(viewModel.reviews) { review in
                    ReviewRow(review: review)
                }
            }
        }
    }
}

struct ReviewRow: View {
    var review: ReviewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(review.name)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(String(review.rating) + "/5")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            Text(review.text)
                .padding(.bottom, 2.0)
                .padding(.top, 2.0)
                .foregroundColor(ColorConstants.inputNameTextColor)
            Text(review.time)
        }
    }
}

struct BusinessReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessReviewsView(viewModel:
    ResultsViewModel(reviews: MockData.reviews,
                     isLoadingReviews: false))
    }
}

