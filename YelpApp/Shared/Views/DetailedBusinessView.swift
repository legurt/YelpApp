//
//  DetailedBusinessView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 20.11.2022.
//

import SwiftUI

struct DetailedBusinessView: View {
    
    @ObservedObject var viewModel: ResultsViewModel
    
    var body: some View {
        if viewModel.detailedBusiness.id == nil {
            CustomProgressView()
        }
        else {
            VStack() {
                Text(viewModel.detailedBusiness.name ?? "")
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                
                DetailedInformationView(detailedBusiness: viewModel.detailedBusiness)
                
                ReservationButton()
                
                ShareBusinessView()
                    .padding()
                
                if viewModel.detailedBusiness.images != nil {
                    ImageSliderView(images: viewModel.detailedBusiness.images!)
                        .frame(width: 300, height: 230)
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle(Text(""), displayMode: .inline)
        }
    }
}

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
                        Text("Visit Yelp for more")
                        Link("Business Link",
                             destination: URL(string: url)!)
                    }
                }
            }
        }
    }
}

struct ReservationButton: View {
    var body: some View {
        Button("Reserve Now") {
            print("Reserved")
        }
        .frame(width: 130.0, height: 50.0)
        .background(.red)
        .foregroundColor(.white)
        .cornerRadius(15.0)
    }
}

struct ShareBusinessView: View {
    var body: some View {
        HStack {
            Text("Share no:").bold()
            Button {
                print("Facebook tapped")
            } label: {
                Image("facebook")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            Button {
                print("Twitter tapped")
            } label: {
                Image("twitter")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
        }
    }
}

struct DetailedBusinessView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedBusinessView(viewModel: ResultsViewModel(detailedBusiness: MockData.detiailedBusiness))
    }
}
