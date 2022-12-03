//
//  Constants.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 14.11.2022.
//

import SwiftUI

struct NetworkConstants {
    static let baseHost = "https://csci571-assignment6-362704.lm.r.appspot.com/"
    static let ipInfoHost = "https://ipinfo.io/json?token="
    static let ipInfoToken = "7bbc2f52c4af02"
}

struct ColorConstants {
    static let backgroundColor = Color(red: 248.0/255.0, green: 244.0/255.0, blue: 252.0/255.0)
    static let inputNameTextColor = Color(red: 132.0/255.0, green: 132.0/255.0, blue: 132.0/255.0)
    static let submitButtonDisabledColor = Color(red: 172.0/255.0, green: 172.0/255.0, blue: 172.0/255.0)
    static let greyPickerBackground = Color(red: 242.0/255.0, green: 242.0/255.0, blue: 247.0/255.0)
}

struct ImageConstants {
    static let calendarImage = Image(systemName: "calendar.badge.clock")
}

struct PickerOptionsConstants {
    static let categories = ["Default",
                             "Arts and Entertainment",
                             "Health and Medical",
                             "Hotels and Travel",
                             "Food",
                             "Professional Services"]
    
    static let hours = ["10",
                        "11",
                        "12",
                        "13",
                        "14",
                        "15",
                        "16",
                        "17"]
    
    static let minutes = ["00",
                          "15",
                          "30",
                          "45"]
}
