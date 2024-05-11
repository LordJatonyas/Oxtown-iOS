//
//  OriginalEventsView.swift
//  Oxtown
//
//  Created by John Lee on 9/5/24.
//

import SwiftUI

struct OriginalEventsView: View {
    
    @State var events = [
            Event(image: "LLMxLaw",
                  title: "LLM X Law Hackathon",
                  start_time:"23 Jun 0800H",
                  distance: 145,
                  free: true,
                  available: true,
                  website: "https://hackthelaw-cambridge.com"
                )
    ]
    
    @State private var isSidebarOpened = false
    @State private var searchText = ""
    
    
    var body: some View {
        ZStack{
            NavigationStack {
                ScrollView(showsIndicators: false) {
                    Spacer()
                    LazyVStack(spacing: 10) {
                        ForEach(events) {
                            event in EventIcon(event: event)
                                .environment(\.colorScheme, .light)
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Image(systemName: "magnifyingglass")
                            .padding(.top)
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Events")
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            isSidebarOpened.toggle()
                        }, label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.sand)
                        })
                    }
                }
                .navigationTitle("Events")
                .fontWeight(.bold)
                .navigationBarTitleDisplayMode(.inline)
                .padding(.top)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(BackgroundAnimationView())
                
            }
            .gesture(DragGesture()
                .onEnded({value in
                    let horizontalSwipe = value.translation.width
                    if horizontalSwipe > 0 {
                        isSidebarOpened.toggle()
                    }
                }))
            SideMenuView(isSidebarVisible: $isSidebarOpened)
        }
    }
}

#Preview {
    OriginalEventsView()
}
