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
                          name: "Resident",
                          categories:
                                "Cocktail Bars | Music Venues | Beer Gardens",
                          coordinates: nil,
                          phone: "(323) 924-9116",
                          isOpen: true,
                          address:
                                "428 S Hewitt St, Los Angeles, CA 90013",
                          images: ["https://s3-media1.fl.yelpcdn.com/bphoto/prOnT088IHeWq3UqY9Pmyw/o.jpg",
                                   "https://s3-media2.fl.yelpcdn.com/bphoto/gH5cz0vki6R6lGDtrU1L9Q/o.jpg",
                                   "https://s3-media2.fl.yelpcdn.com/bphoto/nyBHT0nu7RlNuploWaJiWg/o.jpg"],
                          price: "$$",
                          yelpUrl: "https://www.yelp.com/biz/poppy-rose-los-angeles?adjust_creative=roCEFkJffJu3H8IuKTAK4A&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=roCEFkJffJu3H8IuKTAK4A")
    
    static let coordinates: CoordinatesModel = CoordinatesModel(lattitude: 34.022350, longitude: -118.285118)
}
