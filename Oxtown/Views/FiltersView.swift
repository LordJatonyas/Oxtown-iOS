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
                Color.white.opacity(0.6)
                    .ignoresSafeArea()
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button(action: {
                                show.toggle()
                            }, label: {
                                Text("Done")
                            })
                        }
                    }
                    .background(BackgroundAnimationView())
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(.visible, for: .navigationBar)
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 10) {
                        Spacer()
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
}

#Preview {
    FiltersView(show: .constant(true))
}
