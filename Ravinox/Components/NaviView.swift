//
//  NaviView.swift
//  oxery
//
//  Created by John Lee on 1/5/24.
//

import SwiftUI

struct NaviView: View {
    var body: some View {
        NavigationView {
            NavigationLink("Welcome#$$") {
                ContentView()
            }
            .foregroundColor(.mountainGreen)
            .navigationTitle("main")
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(.mountainGreen)
    }
}

#Preview {
    NaviView()
}
