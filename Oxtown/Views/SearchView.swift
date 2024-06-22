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
        VStack {
            SearchBar(text: $searchText)
            Spacer()
        }
    }
}

#Preview {
    SearchView()
}
