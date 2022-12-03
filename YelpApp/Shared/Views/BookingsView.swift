//
//  BookingsView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 15.11.2022.
//

import SwiftUI

struct BookingsView: View {
    
    
    var body: some View {
        VStack {
            Text("Hello")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ColorConstants.backgroundColor)
        .navigationTitle("Your Reservations")
    }
}

struct BookingsView_Previews: PreviewProvider {
    static var previews: some View {
        BookingsView()
    }
}
