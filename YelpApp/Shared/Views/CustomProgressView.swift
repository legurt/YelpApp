//
//  CustomProgressView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 25.11.2022.
//

import SwiftUI

struct CustomProgressView: View {
    var body: some View {
        VStack {
            ProgressView()
            Text("Please wait...")
                .foregroundColor(ColorConstants.inputNameTextColor)
        }
    }
}
