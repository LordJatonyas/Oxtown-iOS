//
//  MyEventsView.swift
//  Oxtown
//
//  Created by John Lee on 9/5/24.
//

import SwiftUI
import SwiftData

struct MyEventsView: View {
    
    @State var my_events: [Event] = []

    var body: some View {
        if my_events.isEmpty {
            ContentUnavailableView(label: {
                Label("No Events", systemImage: "list.bullet.rectangle.portrait")
            }, description: {
                Text("Start adding Events to your list!")
            })
        } else {
            ScrollView {
                Spacer()
                LazyVStack(spacing: 10) {
                    ForEach(my_events) {
                        event in EventIconRect(event: event)
                            .environment(\.colorScheme, .light)
                    }
                }
            }
            .scrollIndicators(.hidden)
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
    Text("My Events")
    // MyEventsView()
}
