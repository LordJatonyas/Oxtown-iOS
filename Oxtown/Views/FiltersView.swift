//
//  FiltersView.swift
//  Oxtown
//
//  Created by John Lee on 10/5/24.
//

import SwiftUI



struct FiltersView: View {
    @Binding var show: Bool
    
    @State var tags = [
        Tag(title: "Balls", emoji: "🥂"),
        Tag(title: "Hackathons", emoji: "⌨️")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.6)
                    .ignoresSafeArea()
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button{ show.toggle() }
                        label: { Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(Color.white)
                            .imageScale(.large) }
                        }
                    }
                    .background(LinearGradient(colors: [.mint.opacity(0.6), .coralPink.opacity(0.7)], startPoint: .leading, endPoint: .trailing))
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(.hidden, for: .navigationBar)
                VStack {
                    ForEach(Array(stride(from: 0, to: self.tags.count, by: 3)), id: \.self) { t in
                        HStack {
                            ForEach(0..<2) { i in
                                TagIcon(tag: tags[t + i])
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FiltersView(show: .constant(true))
}
