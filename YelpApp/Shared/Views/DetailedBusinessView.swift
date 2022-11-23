//
//  DetailedBusinessView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 20.11.2022.
//

import SwiftUI

struct DetailedBusinessView: View {
    
    var detailedBusiness: DetailedBusinessModel
    
    var body: some View {
        Text(detailedBusiness.name ?? "")
    }
}
