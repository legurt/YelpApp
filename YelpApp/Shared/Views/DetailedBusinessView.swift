//
//  DetailedBusinessView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 20.11.2022.
//

import SwiftUI

struct DetailedBusinessView: View {
    
    var detailedBusiness: DetailedBusinessModel
    
    var body: some View {
            if detailedBusiness.id == nil {
                VStack {
                    ProgressView()
                    Text("Please wait...")
                        .foregroundColor(ColorConstants.inputNameTextColor)
                }
            }
            else {
                VStack() {
                    Text(detailedBusiness.name ?? "")
                        .font(.title)
                        .bold()
                        .padding(.bottom)
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

                    Button("Reserve Now") {
                        print("Reserved")
                    }
                    .frame(width: 130.0, height: 50.0)
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(15.0)
                    
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
                    }.padding()
                    
                    if detailedBusiness.images != nil {
                            ImageSliderView(images: detailedBusiness.images!)
                            .frame(width: 300, height: 230)
                    }
                    Spacer()
                }
                .padding()
                .navigationBarTitle(Text(""), displayMode: .inline)
        }
    }
}

struct DetailedBusinessView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedBusinessView(detailedBusiness: MockData.detiailedBusiness)
    }
}
