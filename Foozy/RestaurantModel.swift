//
//  RestaurantModel.swift
//  Foozy
//
//  Created by Gabriel Tanod on 21/03/25.
//

import SwiftData
import SwiftUI

@Model
class Restaurant: Identifiable {
    var id: UUID = UUID()
    var name: String
    var cuisine: String
    var priceLevel: Int
    var isHalal: Bool
    var isNonHalal: Bool
    var isIndoor: Bool
    var isOutdoor: Bool
    var isSmokingFriendly: Bool
    var isNonSmoking: Bool
    var restaurantDescription: String
    var phoneNumber: String
    var email: String
    var images: [String]
    var pdfFileName: String?

    init(
        name: String,
        cuisine: String,
        priceLevel: Int,
        isHalal: Bool,
        isNonHalal: Bool,
        isIndoor: Bool,
        isOutdoor: Bool,
        isSmokingFriendly: Bool,
        isNonSmoking: Bool,
        restaurantDescription: String,
        phoneNumber: String = "",
        email: String = "",
        images: [String] = []
    ) {
        self.name = name
        self.cuisine = cuisine
        self.priceLevel = priceLevel
        self.isHalal = isHalal
        self.isNonHalal = isNonHalal
        self.isIndoor = isIndoor
        self.isOutdoor = isOutdoor
        self.isSmokingFriendly = isSmokingFriendly
        self.isNonSmoking = isNonSmoking
        self.restaurantDescription = restaurantDescription
        self.phoneNumber = phoneNumber
        self.email = email
        self.images = images
        self.pdfFileName = pdfFileName

    }
}
