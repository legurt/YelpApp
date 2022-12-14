//
//  TabBarView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 22.11.2022.
//

import SwiftUI

struct TabBarView: View {
    var businessId: String

    @StateObject private var viewModel = ResultsViewModel()

    var body: some View {
        TabView {
            DetailedBusinessView(viewModel: viewModel)
                .tabItem {
                    Label("Business Detail", systemImage: "text.bubble.fill")
                }
            
            BusinessLocationView(latitude: viewModel.detailedBusiness.coordinates?.lattitude ?? 0,
                                 longitude: viewModel.detailedBusiness.coordinates?.longitude ?? 0)
                .tabItem {
                    Label("Map Location", systemImage: "location.fill")
                }

            BusinessReviewsView(viewModel: viewModel)
            .tabItem {
                Label("Reviews", systemImage: "message.fill")
            }
        }.onAppear {
            viewModel.getDetailedBusiness(id: businessId)
            viewModel.getReviews(id: businessId)
        }
    }
}
