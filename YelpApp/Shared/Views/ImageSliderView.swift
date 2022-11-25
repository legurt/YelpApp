//
//  ImageSliderView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 24.11.2022.
//

import Foundation
import SwiftUI

struct ImageSliderView: View {
    let images: [String]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { url in
                AsyncImage(url: URL(string: url)) { image in
                    image.resizable()
                         .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
