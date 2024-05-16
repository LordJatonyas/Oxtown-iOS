//
//  MyEventsView.swift
//  Oxtown
//
//  Created by John Lee on 9/5/24.
//

import SwiftUI

struct MyEventsView: View {
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Spacer()
            LazyVStack(spacing: 10) {
                ForEach(my_events) {
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
