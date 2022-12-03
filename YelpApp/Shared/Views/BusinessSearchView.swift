//
//  ContentView.swift
//  Shared
//
//  Created by Leonid Hurtovyi on 14.11.2022.
//

import SwiftUI

struct BusinessSearchView: View {

    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                ColorConstants.backgroundColor
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Form(content: {
                        Section {
                            SearchView(viewModel: viewModel)
                        }
                        Section {
                            ResultsView(viewModel: viewModel)
                        }
                    })
                }
                .navigationTitle("Business Search")
                .navigationBarItems(trailing:
                    CalendarNavigationButton()
                )
            }
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

struct BusinessSearchView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSearchView()
    }
}
