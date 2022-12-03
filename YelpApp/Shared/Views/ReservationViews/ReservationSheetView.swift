//
//  ReservationSheet.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 26.11.2022.
//

import SwiftUI

struct ReservationSheetView: View {
    @Environment(\.presentationMode) var presentationMode

    @State var businessName: String
    @State var isSuccess: Bool = false

    var body: some View {
        if !isSuccess {
            ReservationView(businessName: businessName,
                            didSubmit: { isSuccess = true })
        } else {
            ConfirmationView(businessName: businessName,
                             didTapDone: closeSheet)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                      withAnimation {
                        closeSheet()
                      }
                    }
                }
        }
    }
    
    func closeSheet() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct ReservationSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationSheetView(businessName: "Spudnuts Donuts")
    }
}
