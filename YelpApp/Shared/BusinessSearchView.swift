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

                TextField("", text: $category)
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
                    .lineLimit(1)
                    .foregroundColor(ColorConstants.inputNameTextColor)
                    .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)

                Toggle("", isOn: $autoDetectToggle).labelsHidden()
            }
        })
    }
}

struct BusinessSearchView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSearchView()
    }
}
