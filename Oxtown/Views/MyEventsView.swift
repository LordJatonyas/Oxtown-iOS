//
//  MyEventsView.swift
//  Oxtown
//
//  Created by John Lee on 9/5/24.
//

import SwiftUI

struct MyEventsView: View {
    
    @State var events: [Event] = [
        Event(image: "LLMxLaw",
              title: "LLM X Law Hackathon",
              start_time:"23 Jun 0800H",
              distance: 145,
              free: true,
              available: true,
              website: "https://hackthelaw-cambridge.com"
             )
        ]
    
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Spacer()
            LazyVStack(spacing: 10) {
                ForEach(events) {
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
    MyEventsView()
}
