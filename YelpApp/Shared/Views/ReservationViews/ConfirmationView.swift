//
//  ConfirmationView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 30.11.2022.
//

import SwiftUI

struct ConfirmationView: View {
    
    @State var businessName: String
    var didTapDone: Closure?

    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack() {
                    Text("Congratulations!")
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                    Text("You have successfuly made an reservation at")
                        .foregroundColor(.white)
                    Text(businessName)
                        .foregroundColor(.white)
                }
                .padding(.top, 300.0)
                VStack {
                    Button("Done") {
                        didTapDone?()
                    }.foregroundColor(.green)
                        .frame(width: 190.0, height: 50.0)
                        .background(.white)
                        .cornerRadius(30.0)
                }
                .frame(maxHeight:.infinity, alignment: .bottom)
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView(businessName: "Spudnuts Donuts")
    }
}
