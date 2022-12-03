//
//  BookingsView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 15.11.2022.
//

import SwiftUI

struct BookingsView: View {
    
    @AppStorage("reservations") var reservations: [ReservationModel] = []
    
    var body: some View {
        VStack {
            if reservations.isEmpty {
                Text("No bokings found")
                    .foregroundColor(.red)
            } else {
                List {
                    ForEach(reservations, id: \.self) {
                        BookingRow(reservation: $0)
                    }.onDelete(perform: removeRows)
                }
            }
        }
        .navigationTitle("Your Reservations")
    }
    
    func removeRows(at offsets: IndexSet) {
        reservations.remove(atOffsets: offsets)
    }
}

struct BookingRow: View {
    
    var reservation: ReservationModel
    
    var body: some View {
        HStack {
            Text(reservation.businessName)
                .font(.footnote)
            Text(reservation.date)
                .font(.footnote)
            Text(reservation.time)
                .font(.footnote)
            Text(reservation.email)
                .frame(maxWidth: .infinity)
                .font(.footnote)
        }
    }
}

struct BookingsView_Previews: PreviewProvider {
    static var previews: some View {
        BookingsView(reservations: MockData.reservations)
    }
}
