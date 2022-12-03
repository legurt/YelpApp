//
//  DetailedInformationView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 02.12.2022.
//

import SwiftUI

struct DetailedInformationView: View {
    var detailedBusiness: DetailedBusinessModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                if let address = detailedBusiness.address {
                    VStack(alignment: .leading) {
                        Text("Address")
                            .bold()
                        Text(address)
                            .foregroundColor(ColorConstants.inputNameTextColor)
                    }
                }
                if let phone = detailedBusiness.phone {
                    VStack(alignment: .leading) {
                        Text("Phone")
                            .bold()
                        Text(phone)
                            .foregroundColor(ColorConstants.inputNameTextColor)
                    }
                }
                if let status = detailedBusiness.isOpen {
                    VStack(alignment: .leading) {
                        Text("Status").bold()
                        if status {
                            Text("Open Now")
                                .foregroundColor(.green)
                        } else {
                            Text("Closed")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            
            VStack(alignment: .trailing, spacing: 20) {
                if let categories = detailedBusiness.categories {
                    VStack(alignment: .trailing) {
                        Text("Category").bold()
                        Text(categories)
                            .foregroundColor(ColorConstants.inputNameTextColor)
                    }
                }
                if let price = detailedBusiness.price {
                    VStack(alignment: .trailing) {
                        Text("Price Range").bold()
                        Text(price)
                            .foregroundColor(ColorConstants.inputNameTextColor)
                    }
                }
                if let url = detailedBusiness.yelpUrl {
                    VStack(alignment: .trailing) {
                        Text("Visit Yelp for more").bold()
                        Link("Business Link",
                             destination: URL(string: url)!)
                    }
                }
            }
        }
    }
}
