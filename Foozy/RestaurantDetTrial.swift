//
//  RestaurantDetTrial.swift
//  Foozy
//
//  Created by Griselda Shavilla on 08/04/25.
//

import PDFKit
import SwiftUI

struct RestaurantDetTrial: View {
    var restaurant: Restaurant
    @State private var currentIndex = 0
    @State private var showPDF = false
    @Environment(\.dismiss) private var dismiss
    var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {

                        // Image Carousel
                        TabView(selection: $currentIndex) {
                            ForEach(0..<restaurant.images.count, id: \.self) {
                                index in
                                Image(restaurant.images[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .cornerRadius(20)
                                    .clipped()
                                    .onTapGesture {
                                        print("Clicked on image \(index + 1)")
                                    }
                                    .tag(index)
                            }
                            .padding(.horizontal)

                        }
                        .frame(height: 200)
                        .tabViewStyle(
                            PageTabViewStyle(indexDisplayMode: .never)
                        )
                        .overlay(
                            HStack(spacing: 8) {
                                ForEach(0..<restaurant.images.count, id: \.self)
                                { index in
                                    Circle()
                                        .fill(
                                            currentIndex == index
                                                ? Color.white
                                                : Color.white.opacity(0.5)
                                        )
                                        .frame(width: 8, height: 8)
                                }
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                Color.black.opacity(0.4).clipShape(Capsule())
                            )
                            .padding(.bottom, 10),
                            alignment: .bottom
                        )
                        .onReceive(timer) { _ in
                            withAnimation {
                                currentIndex =
                                    (currentIndex + 1) % restaurant.images.count
                            }
                        }

                        // Restaurant Info
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image(restaurant.name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .padding(4)
                                    .background(
                                        Circle()
                                            .stroke(Color.foozy, lineWidth: 2)
                                    )
                                    .padding(.trailing)

                                VStack(alignment: .leading) {
                                    Text(restaurant.name)
                                        .font(.system(size: 30))
                                        .fontWeight(.bold)

                                    HStack {
                                        Text(
                                            restaurant.priceLevel == 1
                                                ? "$"
                                                : restaurant.priceLevel == 2
                                                    ? "$$"
                                                    : restaurant.priceLevel == 3
                                                        ? "$$$"
                                                        : restaurant.priceLevel
                                                            == 4
                                                            ? "$$$$"
                                                            : "Unknown"
                                        )
                                        Text(
                                            restaurant.priceLevel == 1
                                                ? "Rp.30.000 - Rp.50.000"
                                                : restaurant.priceLevel == 2
                                                    ? "Rp.50.000 - Rp.100.000"
                                                    : restaurant.priceLevel == 3
                                                        ? "Rp.100.000 - Rp.200.000"
                                                        : restaurant.priceLevel
                                                            == 4
                                                            ? "Rp.200.000+"
                                                            : "Unknown"
                                        )
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                        .fontWeight(.light)
                                    }
                                }

                                Spacer()
                            }

                            HStack(spacing: 3) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image(systemName: "fork.knife.circle")
                                        Text(restaurant.cuisine)
                                            .font(.callout)
                                        Spacer()
                                    }
                                    HStack {
                                        Image(systemName: "leaf")
                                        Text(
                                            restaurant.isHalal
                                                ? "Halal" : "Non Halal"
                                        )
                                        .font(.callout)
                                        Spacer()
                                    }
                                    .padding(.top, 0.5)
                                }

                                VStack(alignment: .leading) {
                                    HStack {
                                        Image(systemName: "sun.max")
                                        Text(
                                            restaurant.isIndoor
                                                ? "Indoor" : "Outdoor"
                                        )
                                        .font(.callout)
                                        Spacer()
                                    }
                                    HStack {
                                        Image(systemName: "smoke")
                                        Text(
                                            restaurant.isSmokingFriendly
                                                ? "Smoking Friendly"
                                                : "Not Smoking Friendly"
                                        )
                                        .font(.callout)
                                    }
                                    .padding(.top, 0.5)
                                }
                                .padding(.leading, -10)
                            }
                            .padding(.top, 35)
                            .font(.subheadline)
                        }
                        .padding(.horizontal)

                        // About Section
                        VStack(alignment: .leading, spacing: 2) {
                            Text("About")
                                .font(.headline)
                                .fontWeight(.bold)

                            Text("\(restaurant.restaurantDescription)")
                                .font(.callout)
                                .padding(.top, 5)
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)

                        // Contact Section
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Contact")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.bottom, 5)

                            HStack(alignment: .firstTextBaseline, spacing: 8) {
                                Image(systemName: "phone")
                                    .frame(width: 20, alignment: .leading)
                                Text(restaurant.phoneNumber)
                                    .font(.callout)
                            }

                            HStack(alignment: .firstTextBaseline, spacing: 8) {
                                Image(systemName: "envelope")
                                    .frame(width: 20, alignment: .leading)
                                Text(restaurant.email)
                                    .font(.callout)
                            }
                        }
                        .padding(.top, 30)
                        .padding(.horizontal)
                    }
                }

                // Bottom Gradient Overlay
                //                LinearGradient(
                //                    gradient: Gradient(colors: [Color.clear, Color.white]),
                //                    startPoint: .top,
                //                    endPoint: .bottom
                //                )
                //                .frame(height: 50)
                //                .allowsHitTesting(false)
            }

            // Menu Button
            Button(action: {
                showPDF = true
            }) {
                Text("Menu")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.foozy)
                    .cornerRadius(10)
            }
            .padding()
            .fullScreenCover(isPresented: $showPDF) {
                PDFViewer(pdfName: restaurant.name)
            }
            .tint(.orange)
        }
    }
}

struct PDFViewer: View {
    let pdfName: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Group {
                if let url = Bundle.main.url(
                    forResource: pdfName,
                    withExtension: "pdf"
                ),
                    let document = PDFDocument(url: url)
                {
                    PDFKitView(pdfDocument: document)
                } else {
                    Text("Could not find PDF named \"\(pdfName).pdf\"")
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .navigationTitle(pdfName)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct PDFKitView: UIViewRepresentable {
    let pdfDocument: PDFDocument

    func makeUIView(context: Context) -> PDFView {
        let view = PDFView()
        view.document = pdfDocument
        view.autoScales = true
        return view
    }

    func updateUIView(_ uiView: PDFView, context: Context) {}
}

struct RestaurantDetTrial_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetTrial(
            restaurant: Restaurant(
                name: "Sushi House",
                cuisine: "Japanese",
                priceLevel: 2,
                isHalal: true,
                isNonHalal: false,
                isIndoor: true,
                isOutdoor: false,
                isSmokingFriendly: false,
                isNonSmoking: true,
                restaurantDescription: "A cozy place to enjoy sushi.",
                phoneNumber: "123-456-7890",
                email: "contact@sushihouse.com",
                images: ["BurgreensFood1", "BurgreensResto1"]
            )
        )
    }
}
