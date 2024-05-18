//
//  SearchBar.swift
//  Oxtown
//
//  Created by John Lee on 11/5/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    let title: String
    let placeholder: String = "Search for Events"
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.sand)
            TextField(placeholder, text: $text)
                .foregroundStyle(.sand)
                .textInputAutocapitalization(.never)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
                
            Button(action: {
                text = ""
                },label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundStyle(.sand)
                    .opacity(text.isEmpty ? 0 : 1)
            })
            Spacer()
        }
        .frame(width: 340, height: 50)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(.sand))
    }
}

