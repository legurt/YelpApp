//
//  ToastView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 27.11.2022.
//

import SwiftUI

struct Toast<Presenting>: View where Presenting: View {

    @Binding var isShowing: Bool

    let presenting: () -> Presenting

    let text: Text

    var body: some View {
        ZStack(alignment: .bottom) {

            self.presenting()

            VStack {
                self.text
            }
            .frame(width: 250,
                   height: 90)
            .background(Color.secondary.colorInvert())
            .foregroundColor(Color.primary)
            .cornerRadius(20)
            .transition(.slide)
            .opacity(self.isShowing ? 1 : 0)
        }
    }

}
