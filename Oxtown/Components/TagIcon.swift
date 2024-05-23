//
//  TagIcon.swift
//  Oxtown
//
//  Created by John Lee on 10/5/24.
//

import SwiftUI

struct TagIcon: View {
    @State var selected: Bool = false
    var tag: Tag
    
    var body: some View {
        HStack {HStack {
                Spacer()
                    .frame(width: 10)
                Text(tag.emoji + " " + tag.title)
                    .foregroundStyle(.black)
                Spacer()
                    .frame(width: 10)
            }
            .frame(height: 30)
            .background(selected ? .coralPink.opacity(0.5) : .sand.opacity(0.6))
            .cornerRadius(20.0)
            .onTapGesture {
                withAnimation {
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    selected.toggle()
                }
            }
            .overlay(RoundedRectangle(cornerRadius: 20.0)
                .strokeBorder(selected ? .red.opacity(0.7) : .white.opacity(0.7), lineWidth: 2))
            
            Spacer()
                .frame(width: 20)
        }
        
    }
}

#Preview {
    VStack {
        TagIcon(tag: Tag(title: "Balls", emoji: "🥂"))
        TagIcon(tag: Tag(title: "Bands/Music/Orchestra", emoji: "🎶"))
    }
}
