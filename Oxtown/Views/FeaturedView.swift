//
//  SwiftUIView.swift
//  Oxtown
//
//  Created by John Lee on 16/5/24.
//

import SwiftUI

struct FeaturedView: View {
    
    @State var featured_events: [Event] = []
    
    var body: some View {
        if featured_events.isEmpty {
            ContentUnavailableView(label: {
                Label("No Events", systemImage: "xmark")
            }, description: {
                Text("We're working on it!")
            })
        } else {
            ScrollView {
                Spacer()
                LazyVStack(spacing: 10) {
                    ForEach(featured_events) {
                        event in EventIcon(event: event)
                            .environment(\.colorScheme, .light)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    Text("HEllo")
    // FeaturedView()
}
