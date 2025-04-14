import SwiftData
//
//  FilterView.swift
//  Foozy
//
//  Created by Gabriel Tanod on 08/04/25.
//
import SwiftUI

struct FilterView: View {
    @Binding var isPresented: Bool
    @Binding var selectedPrice: Int
    @Binding var selectedFilterCuisines: Set<String>
    @Binding var isHalal: Bool
    @Binding var isNonHalal: Bool
    @Binding var isIndoor: Bool
    @Binding var isOutdoor: Bool
    @Binding var isSmokingFriendly: Bool
    @Binding var isNonSmoking: Bool

    let filteredCount: Int
    let priceOptions = ["All", "$", "$$", "$$$", "$$$$"]
    let cuisineOptions = [
        "Japanese", "Italian", "Indonesian", "Western", "Chinese",
        "Thai",
    ]

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        // Price Range
                        HStack {
                            Text("Price Range")
                            Spacer()
                        }
                        .font(.system(size: 16, weight: .bold))
                        .padding(.bottom, 10)

                        Picker("", selection: $selectedPrice) {
                            ForEach(0..<priceOptions.count, id: \.self) {
                                index in
                                Text(priceOptions[index]).tag(index)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.bottom, 20)

                        // Cuisines
                        HStack {
                            Text("Cuisines")
                            Spacer()
                        }
                        .font(.system(size: 16, weight: .bold))
                        .padding(.bottom, 10)

                        LazyVGrid(columns: [
                            GridItem(.flexible()), GridItem(.flexible()),
                        ]) {
                            ForEach(cuisineOptions, id: \.self) { cuisine in
                                Button(action: {
                                    if selectedFilterCuisines.contains(cuisine)
                                    {
                                        selectedFilterCuisines.remove(cuisine)
                                    } else {
                                        selectedFilterCuisines.insert(cuisine)
                                    }
                                }) {
                                    ZStack {
                                        if selectedFilterCuisines.contains(
                                            cuisine
                                        ) {
                                            Image("sushi")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 160, height: 45)
                                                .clipShape(
                                                    RoundedRectangle(
                                                        cornerRadius: 10
                                                    )
                                                )
                                                .overlay(
                                                    Color.foozy.opacity(1)
                                                        .clipShape(
                                                            RoundedRectangle(
                                                                cornerRadius: 10
                                                            )
                                                        )
                                                )
                                                .frame(width: 160, height: 45)
                                        } else {
                                            Color.ourWhite
                                                .frame(width: 160, height: 45)
                                                .clipShape(
                                                    RoundedRectangle(
                                                        cornerRadius: 10
                                                    )
                                                )
                                        }

                                        Text(cuisine)
                                            .foregroundColor(
                                                selectedFilterCuisines.contains(
                                                    cuisine
                                                ) ? .white : .orange
                                            )
                                            .fontWeight(.bold)
                                            .frame(width: 160, height: 45)
                                            .background(
                                                RoundedRectangle(
                                                    cornerRadius: 10
                                                )
                                                .stroke(
                                                    Color.ourWhite,
                                                    lineWidth: 2
                                                )
                                            )
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)

                        // Food Category
                        Group {
                            HStack {
                                Text("Food Category")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(.top, 20)
                                Spacer()
                            }
                            Toggle("Halal Certified", isOn: $isHalal)
                                .font(.system(size: 16, design: .default))
                                .tint(.foozy)
                            //                                Toggle("Non-Halal", isOn: $isNonHalal)
                            //                                    .font(.system(size: 16, design: .default))
                        }

                        // Seating
                        Group {
                            HStack {
                                Text("Seating")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(.top, 20)
                                Spacer()
                            }
                            //                                Toggle("Indoor", isOn: $isIndoor)
                            //                                    .font(.system(size: 16, design: .default))
                            Toggle("Outdoor", isOn: $isOutdoor)
                                .font(.system(size: 16, design: .default))
                                .tint(.foozy)
                        }

                        // Smoking Policy
                        Group {
                            HStack {
                                Text("Smoking Policy")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(.top, 20)

                                Spacer()
                            }
                            Toggle("Smoking Friendly", isOn: $isSmokingFriendly)
                                .font(.system(size: 16, design: .default))
                                .tint(.foozy)
                            Toggle("Non-Smoking", isOn: $isNonSmoking)
                                .font(.system(size: 16, design: .default))
                                .tint(.foozy)
                        }
                    }
                    .padding()
                }

                // DONE BUTTON at the bottom
                Button(action: {
                    isPresented = false
                }) {
                    Text(
                        "See \(filteredCount) result\(filteredCount == 1 ? "" : "s")"
                    )
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.foozy)
                    .cornerRadius(10)
                    .padding()
                    .fontWeight(.bold)
                }
            }
            .navigationTitle("Filters")
        }
    }
}

//#Preview {
//    FilterView()
//}
