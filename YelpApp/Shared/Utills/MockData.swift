//
//  File.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 24.11.2022.
//

import Foundation

struct MockData {
    static let reviews: [ReviewModel] = [
        ReviewModel(id: "",
                    rating: 4,
                    name: "Leonid",
                    text: "I love Re Grocery! They have a great selection of all the pantry foods I could want, plus some high quality eggs, kombucha, etc. I love how it's almost all...",
                    time: "2022-09-20"),
        ReviewModel(id: "",
                    rating: 3,
                    name: "Borys",
                    text: "First time here and it was so fun! Picked up some dried corn chowder, matcha superlatte, toothpaste bites, jelly beans, oatmeal, shiitake mushrooms, dried...",
                    time: "2022-10-05"),
        ReviewModel(id: "",
                    rating: 5,
                    name: "Marco",
                    text: "Re_Grocery had everything we expected and more, and the experience of shopping there was fantastic! It was easy to learn their system, and the guy working...",
                    time: "2022-11-17")
    ]
    
    static let detiailedBusiness: DetailedBusinessModel =
    DetailedBusinessModel(id: "",
                          name: "California Donuts",
                          categories:
                                "Bakeries | Donuts | Coffee & Tea",
                          coordinates: nil,
                          phone: "(323) 924-9116",
                          isOpen: true,
                          address:
                                "3540 W 3rd St, Los Angeles, CA 90020",
                          images: ["https://s3-media2.fl.yelpcdn.com/bphoto/f4qoSJYs1SFdOU2pYaGMWQ/o.jpg",
                                   "https://s3-media3.fl.yelpcdn.com/bphoto/xFJcoSaXM4F9KyZHOU4Mqw/o.jpg",
                                   "https://s3-media2.fl.yelpcdn.com/bphoto/dIAVaGk-Kf1Y8Rpua4jwMg/o.jpg"],
                          price: "$$",
                          yelpUrl: "https://www.yelp.com/biz/california-donuts-los-angeles-2?adjust_creative=roCEFkJffJu3H8IuKTAK4A&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=roCEFkJffJu3H8IuKTAK4A")
    
    static let coordinates: CoordinatesModel = CoordinatesModel(lattitude: 34.022350, longitude: -118.285118)
    
    static let reservations: [ReservationModel] = [
        ReservationModel(businessName: "Spudnuts Donuts",
                         date: "2022-11-05",
                         time: "10:00",
                         email: "Abc@gmail.com"),
        ReservationModel(businessName: "California Donuts",
                         date: "2022-11-05",
                         time: "13:00",
                         email: "Aaa@gmail.com")
    ]
}
