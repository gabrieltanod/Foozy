//
//  SplashScreen.swift
//  Foozy
//
//  Created by Gabriel Tanod on 08/04/25.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Image("FoozySplash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.splashColorBG)
            .onAppear {
                // Delay for 2 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
