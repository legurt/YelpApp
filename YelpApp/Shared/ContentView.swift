//
//  ContentView.swift
//  Shared
//
//  Created by Leonid Hurtovyi on 14.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, world!")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(ColorConstants.backgroundColor)
            .navigationTitle("Business Search")
            .navigationBarItems(trailing:
                CalendarNavigationButton()
            )
        }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
