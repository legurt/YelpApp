//
//  ReservationButton.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 02.12.2022.
//

import SwiftUI

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
