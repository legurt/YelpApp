//
//  DetailedBusinessView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 20.11.2022.
//

import SwiftUI

struct DetailedBusinessView: View {
    
    @ObservedObject var viewModel: ResultsViewModel
    @AppStorage("reservations") var reservations: [ReservationModel] = []
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
                                      didTapCancel: cancelTapped)
                    
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
    
    func cancelTapped() {
        showCancelToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
          withAnimation {
            self.showCancelToast = false
          }
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
    @AppStorage("reservations") var reservations: [ReservationModel] = []
    @State var businessName: String
    @State private var showingSheet = false
    
    var didTapCancel: Closure?
    
    var body: some View {
        Button(!isReserved() ? "Reserve Now" : "Cancel Reservation") {
            if !isReserved() {
                showingSheet.toggle()
            } else {
                removeReservation()
                didTapCancel?()
            }
        }
        .frame(width: !isReserved() ? 130.0 : 170.0, height: 50.0)
        .background(!isReserved() ? .red : .blue)
        .foregroundColor(.white)
        .cornerRadius(15.0)
        .sheet(isPresented: $showingSheet) {
            ReservationSheetView(businessName: businessName)
        }
    }
    
    func isReserved() -> Bool {
        return reservations.contains(where: { $0.businessName == businessName })
    }
    
    func removeReservation() {
        reservations.removeAll { $0.businessName == businessName }
    }
}

struct ShareBusinessView: View {
    var businessName: String
    var businessUrl: String

    var body: some View {
        HStack {
            Text("Share no:").bold()
            Button {
                let stringUrl = "https://www.facebook.com/sharer/sharer.php?u=\(businessUrl)"
                if let url = URL(string: stringUrl) {
                    UIApplication.shared.open(url)
                }
            } label: {
                Image("facebook")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            Button {
                let stringUrl = "https://twitter.com/intent/tweet?text=Check%20"
                + businessName
                + "%20on%20Yelp.%20"
                + businessUrl
                if let url = URL(string: stringUrl) {
                    UIApplication.shared.open(url)
                }
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
