//
//  ContentView.swift
//  oxery
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI

struct BrowseView: View {
    @EnvironmentObject var dataManager: DataManager
    
    // @State var explore_events: [Event] = dataManager.events
    
    var body: some View {
        if dataManager.events.isEmpty {
            ContentUnavailableView(label: {
                Label("No Events", systemImage: "xmark")
            }, description: {
                Text("We're working on it!")
            })
        } else {
            ScrollView(showsIndicators: false) {
                Spacer()
                LazyVStack(spacing: 10) {
                    ForEach(dataManager.events, id: \.id) {
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
    Text("Hi")
}
