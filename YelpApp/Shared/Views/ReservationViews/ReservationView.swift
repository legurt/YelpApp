//
//  ReservationView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 30.11.2022.
//

import SwiftUI

struct ReservationView: View {
    @AppStorage("reservations") var reservations: [ReservationModel] = []
    @State var businessName: String
    @State private var email: String = ""
    @State private var date = Date()
    @State private var hours = "10"
    @State private var minutes = "00"
    @State private var emailInvalid = false
    
    var didSubmit: Closure?

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
                    
                    DatePicker("",
                               selection: $date,
                               in: Date()...,
                               displayedComponents: .date)
                    HStack {
                        Picker("", selection: $hours) {
                            ForEach(PickerOptionsConstants.hours, id: \.self) {
                                Text($0)
                            }
                        }.pickerStyle(.menu)
                         .accentColor(.black)

                        Text(":")
                            .foregroundColor(ColorConstants.inputNameTextColor)

                        Picker("", selection: $minutes) {
                            ForEach(PickerOptionsConstants.minutes, id: \.self) {
                                Text($0)
                            }
                        }.pickerStyle(.menu)
                         .accentColor(.black)
                    }.background(ColorConstants.greyPickerBackground).cornerRadius(5.0)
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
                        } else {
                            submitReservation()
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
        }.toast(isShowing: $emailInvalid, text: Text("Please enter a valid email."))
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func submitReservation() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let stringDate = dateFormatter.string(from: date)
        let time = hours + ":" + minutes
        let reservation = ReservationModel(businessName: businessName,
                                           date: stringDate,
                                           time: time,
                                           email: email)
        reservations.append(reservation)
        didSubmit?()
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView(businessName: "Spudnuts Donuts")
    }
}
