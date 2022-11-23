//
//  TabBarView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 22.11.2022.
//

import SwiftUI

struct TabBarView: View {
    var businessId: String

    @ObservedObject var viewModel = ResultsViewModel()

    var body: some View {
        TabView {
            DetailedBusinessView(detailedBusiness: viewModel.detailedBusiness)
                .tabItem {
                    Label("Business Detail", systemImage: "text.bubble.fill")
                }
            
            BusinessLocationView()
                .tabItem {
                    Label("Map Location", systemImage: "location.fill")
                }

            BusinessReviewsView(businessId: businessId)
                .tabItem {
                    Label("Reviews", systemImage: "message.fill")
                }
        }.onAppear {
            viewModel.getDetailedBusiness(id: businessId)
        }
    }
}
