//
//  ExtensionsToast.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 27.11.2022.
//

import SwiftUI

extension View {

    func toast(isShowing: Binding<Bool>, text: Text) -> some View {
        Toast(isShowing: isShowing,
              presenting: { self },
              text: text)
    }

}
