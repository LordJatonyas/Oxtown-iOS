//
//  ContentView.swift
//  oxery
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI

struct ExploreEventsView: View {
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Spacer()
            LazyVStack(spacing: 10) {
                ForEach(explore_events, id: \.self) {
                    event in EventIcon(event: event)
                        .environment(\.colorScheme, .light)
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
    ExploreEventsView()
}
