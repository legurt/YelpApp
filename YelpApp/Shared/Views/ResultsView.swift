//
//  ResultsView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 17.11.2022.
//

import SwiftUI

struct ResultsView: View {
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        Text("Results")
            .bold()
            .font(.title)
        if viewModel.noResults {
            Text("No result available")
                .foregroundColor(.red)
        }
        if viewModel.isLoadingBusinesses {
            HStack {
                Spacer()

                CustomProgressView()

                Spacer()
            }
        }
        
        List(viewModel.businesses) { business in

            NavigationLink {
                TabBarView(businessId: business.id)
            } label: {
                BusinessRow(business: business)
            }
        }
    }
}

struct BusinessRow: View {
    var business: BusinessModel
    
    var body: some View {
        HStack {
            Text(String(business.number))
            AsyncImage(url: URL(string: business.imageUrl)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8.0)
            .padding(.trailing)
            Text(business.name)
                .foregroundColor(ColorConstants.inputNameTextColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text(String(business.rating))
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color.orange)
            }
            Text(String(Int(business.distance)) + " mi.")
        }
    }
}
