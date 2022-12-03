//
//  DetailedBusinessView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 20.11.2022.
//

import SwiftUI

struct DetailedBusinessView: View {
    
    @ObservedObject var viewModel: ResultsViewModel
    @State private var showCancelToast = false
    
    var body: some View {
        if viewModel.detailedBusiness.id == nil {
            CustomProgressView()
        }
        else {
            ScrollView {
                VStack() {
                    Text(viewModel.detailedBusiness.name ?? "")
                        .font(.title)
                        .bold()
                        .padding(.bottom)
                    
                    DetailedInformationView(detailedBusiness: viewModel.detailedBusiness)
                    
                    ReservationButton(businessName: viewModel.detailedBusiness.name ?? "",
                                      didTapCancel: cancelReservationTapped)
                    
                    ShareBusinessView(businessName: viewModel.detailedBusiness.name ?? "",
                                      businessUrl: viewModel.detailedBusiness.yelpUrl ?? "")
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
            .toast(isShowing: $showCancelToast, text: Text("Your reservation is cancelled."))
        }
    }
    
    func cancelReservationTapped() {
        showCancelToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
          withAnimation {
            self.showCancelToast = false
          }
        }
    }
}

struct DetailedBusinessView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedBusinessView(viewModel: ResultsViewModel(detailedBusiness: MockData.detiailedBusiness))
    }
}
