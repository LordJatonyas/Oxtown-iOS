//
//  ContentView.swift
//  oxery
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI

struct BrowseView: View {
    
    var body: some View {
        if explore_events.isEmpty {
            ContentUnavailableView(label: {
                Label("No Events", systemImage: "xmark")
            }, description: {
                Text("We're working on it!")
            })
        } else {
            ScrollView(showsIndicators: false) {
                Spacer()
                LazyVStack(spacing: 10) {
                    ForEach(explore_events) {
                        event in EventIcon(event: event)
                            .environment(\.colorScheme, .light)
                    }
                }
            }
        }
    
        /*
        .gesture(DragGesture()
            .onEnded({value in
                let horizontalSwipe = value.translation.width
                if horizontalSwipe > 0 {
                    isSidebarOpened.toggle()
                }
            }))
        */
    }
}



#Preview {
    BrowseView()
}
