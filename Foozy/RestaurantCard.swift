//
//  RestaurantCard.swift
//  Foozy
//
//  Created by Gabriel Tanod on 08/04/25.
//

import SwiftData
import SwiftUI

struct RestaurantCard: View {
    var restaurant: Restaurant  // Accepts a Restaurant object

    var body: some View {
        HStack {
            Image(restaurant.images[0])
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding([.trailing], 10)
                .padding([.leading], 0)

            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.headline)
                    .foregroundColor(.primary)

                HStack {
                    Image(systemName: "fork.knife.circle")
                        .foregroundColor(.black)
                        .imageScale(.small)
                    Text(restaurant.cuisine)
                        .font(.callout)
                        .foregroundColor(.black)
                        .fontWeight(.thin)

                    Text(
                        "\(restaurant.isHalal ? "·  Halal" : "") \(restaurant.isNonHalal ? "·  Non-Halal" : "")"
                    )
                    .font(.callout)
                    .foregroundColor(.black)
                    .fontWeight(.thin)
                }
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.black)
                        .imageScale(.small)

                    Text(
                        restaurant.priceLevel == 1
                            ? "$"
                            :  //ganti jadi < 50
                            restaurant.priceLevel == 2
                                ? "$$"
                                : restaurant.priceLevel == 3
                                    ? "$$$"
                                    : restaurant.priceLevel == 4
                                        ? "$$$$" : "$$$$$"
                    )
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .fontWeight(.light)
                }
            }

            Spacer()
        }
        //        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 0.5)
    }
}
