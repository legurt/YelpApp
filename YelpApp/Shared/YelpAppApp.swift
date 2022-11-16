//
//  YelpAppApp.swift
//  Shared
//
//  Created by Leonid Hurtovyi on 14.11.2022.
//

import SwiftUI

@main
struct YelpApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct App_Previews: PreviewProvider {
    static var previews: some View {
        YelpAppApp()
    }
}
