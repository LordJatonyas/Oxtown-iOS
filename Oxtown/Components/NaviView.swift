//
//  NaviView.swift
//  oxery
//
//  Created by John Lee on 1/5/24.
//

import SwiftUI

struct NaviView: View {
    @State private var colors = ["Red", "Green", "Blue"]
    @State private var selectedColor: String?
        
    var body: some View {
        NavigationSplitView {
            List(colors, id: \.self, selection: $selectedColor) { color in
                Text(color).tag(color)
                }
        } detail: {
        Text( selectedColor ?? "No color selected")
        }
        .navigationSplitViewStyle(.automatic)
   
        
        /*
        NavigationView {
            NavigationLink("Welcome#$$") {
                ContentView()
            }
            .foregroundColor(.mountainGreen)
            .navigationTitle("main")
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(.mountainGreen)
        */
    }
}

#Preview {
    NaviView()
}
