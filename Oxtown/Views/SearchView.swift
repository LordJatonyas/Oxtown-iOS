//
//  SearchView.swift
//  Oxtown
//
//  Created by John Lee on 19/5/24.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.coralPink.opacity(0.7), .mint.opacity(0.6)], startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            VStack {
                SearchBar(text: $searchText)
                Spacer()
            }
        }
    }
}

#Preview {
    SearchView()
}
