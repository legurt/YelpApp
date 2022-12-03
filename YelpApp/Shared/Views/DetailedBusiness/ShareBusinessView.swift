//
//  ShareBusinessView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 02.12.2022.
//

import SwiftUI

struct ShareBusinessView: View {
    var businessName: String
    var businessUrl: String

    var body: some View {
        HStack {
            Text("Share no:").bold()
            Button {
                let stringUrl = "https://www.facebook.com/sharer/sharer.php?u=\(businessUrl)"
                if let url = URL(string: stringUrl) {
                    UIApplication.shared.open(url)
                }
            } label: {
                Image("facebook")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            Button {
                let nameWithoutWhitespaces = businessName.replacingOccurrences(of: " ", with: "%20")
                let stringUrl = "https://twitter.com/intent/tweet?text="
                + nameWithoutWhitespaces
                + "%20"
                + businessUrl
                if let url = URL(string: stringUrl) {
                    UIApplication.shared.open(url)
                }
            } label: {
                Image("twitter")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
        }
    }
}
