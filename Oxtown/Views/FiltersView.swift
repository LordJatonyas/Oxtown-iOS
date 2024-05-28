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
        ZStack {
            Color.gray.opacity(0.6)
                .ignoresSafeArea()
                .background(LinearGradient(colors: [.mint.opacity(0.6), .coralPink.opacity(0.7)], startPoint: .leading, endPoint: .trailing))
            VStack {
                ForEach(Array(stride(from: 0, to: self.tags.count, by: 3)), id: \.self) { t in
                    HStack {
                        ForEach(0..<2) { i in
                            TagIcon(tag: tags[t + i])
                        }
                    }
                }
            }
            Button {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundStyle(.black)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(20)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    FiltersView(show: .constant(true))
}
