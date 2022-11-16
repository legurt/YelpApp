//
//  ContentView.swift
//  Shared
//
//  Created by Leonid Hurtovyi on 14.11.2022.
//

import SwiftUI

struct BusinessSearchView: View {
    var body: some View {
        NavigationView {
            VStack {
                SearchView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(ColorConstants.backgroundColor)
            .navigationTitle("Business Search")
            .navigationBarItems(trailing:
                CalendarNavigationButton()
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CalendarNavigationButton: View {
    var body: some View {
        NavigationLink(destination: BookingsView()) {
            ImageConstants.calendarImage
                .imageScale(.large)
                .foregroundColor(.blue)
        }
    }
}

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()

    @State var keyword: String = ""
    @State var distance: String = "10"
    @State var category: String = "Default"
    @State var location: String = ""
    @State var autoDetectToggle: Bool = false

    var body: some View {
        Form(content: {
            HStack {
                Text("Keyword:")
                    .foregroundColor(ColorConstants.inputNameTextColor)
                    .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
                
                TextField("Required", text: $keyword)
                
            }
            HStack {
                Text("Distance:")
                    .foregroundColor(ColorConstants.inputNameTextColor)
                    .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)

                TextField("", text: $distance)
            }
            HStack {
                Text("Category:")
                    .foregroundColor(ColorConstants.inputNameTextColor)
                    .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)

                Picker("", selection: $category) {
                    Text("Default")
                    Text("Arts and Entertainment")
                    Text("Health and Medical")
                    Text("Hotels and Travel")
                    Text("Food")
                    Text("Professional Services")
                }
                .pickerStyle(.menu)
            }
            if !autoDetectToggle {
                HStack {
                    Text("Location:")
                        .foregroundColor(ColorConstants.inputNameTextColor)
                        .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)

                    TextField("Required", text: $location)
                }
            }
            HStack {
                Text("Auto-detect my location")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(ColorConstants.inputNameTextColor)
                    .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)

                Toggle("", isOn: $autoDetectToggle)
                    .onChange(of: autoDetectToggle, perform: { newValue in
                        if newValue {
                            viewModel.getIpInfo()
                        }
                    })
                    .labelsHidden()
            }
            HStack {
                Button("Submit") {
                    print()
                }
                .frame(width: 120.0, height: 55.0)
                .background(ColorConstants.submitButtonDisabledColor)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                .padding()

                Button("Clear") {
                    print()
                }
                .frame(width: 120.0, height: 55.0)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                .padding()
            }
        })
    }
}

struct BusinessSearchView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSearchView()
    }
}
