//
//  ReservationSheet.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 26.11.2022.
//

import SwiftUI

struct ReservationSheetView: View {
    @Environment(\.dismiss) var dismiss
    @State var businessName: String
    @State var email: String = ""
    @State private var date = Date()
    @State private var hours = "10"
    @State private var minutes = "00"
    @State private var emailInvalid = false

    var body: some View {
        Form {
            Section {
                HStack {
                    Spacer()
                    Text("Reservation Form")
                        .bold()
                        .font(.title)
                    Spacer()
                }
            }
            
            Section {
                HStack {
                    Spacer()
                    Text(businessName)
                        .bold()
                        .font(.title)
                    Spacer()
                }
            }
            
            Section {
                HStack {
                    Text("Email:")
                        .foregroundColor(ColorConstants.inputNameTextColor)
                        .font(.callout)
                    
                    TextField("", text: $email)
                }

                HStack {
                    Text("Date/Time:")
                        .foregroundColor(ColorConstants.inputNameTextColor)
                        .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                    
                    DatePicker("", selection: $date, displayedComponents: .date)
                    
                    Picker("", selection: $hours) {
                        Text("10")
                        Text("11")
                        Text("12")
                        Text("13")
                        Text("14")
                        Text("15")
                        Text("16")
                        Text("17")
                    }
                    
                    Picker("", selection: $minutes) {
                        Text("00")
                        Text("15")
                        Text("30")
                        Text("45")
                    }
                }
                
                HStack {
                    Spacer()

                    Button("Submit") {
                        if !isValidEmail(email) {
                            emailInvalid = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                              withAnimation {
                                self.emailInvalid = false
                              }
                            }
                        }
                    }
                    .frame(width: 100.0, height: 50.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(12.0)
                    .padding()
                    .buttonStyle(BorderlessButtonStyle())

                    Spacer()
                }
            }
        }.toast(isShowing: $emailInvalid, text: Text("Please enter a valid email"))
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationSheetView(businessName: "Spudnuts Donuts")
    }
}
