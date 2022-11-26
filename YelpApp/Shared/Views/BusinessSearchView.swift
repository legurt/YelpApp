//
//  ContentView.swift
//  Shared
//
//  Created by Leonid Hurtovyi on 14.11.2022.
//

import SwiftUI

struct BusinessSearchView: View {

    @ObservedObject private var viewModel = SearchViewModel()

    var body: some View {
        NavigationView {
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

struct BusinessSearchView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSearchView()
    }
}
