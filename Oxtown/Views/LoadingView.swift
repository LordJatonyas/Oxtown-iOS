//
//  LoadingView.swift
//  Oxtown
//
//  Created by John Lee on 24/5/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            AnimatedImage(name: "loading_animation.gif")
                .resizable()
                .scaledToFit()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}

#Preview {
    LoadingView()
}
