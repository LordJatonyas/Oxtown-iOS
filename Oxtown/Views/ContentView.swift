//
//  ContentView.swift
//  oxery
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var events = [
        Event(image: "Corpus_Christi_Ball", title: "CCC Ball 2024", start_time: "04 May 1900H", distance: 1, free: false, available: false, website: "https://bookoxex.com/Go/CorpusChristiCollegeBall2024"),
        Event(image: "OUAPS_Ball", title: "OUAPS Ball 2024", start_time: "10 May 2000H", distance: 0, free: false, available: true, website: "https://bookoxex.com/Go/OUAPSBall2024"),
    ]
    
    @State private var isSidebarOpened = false
    @State private var searchText = ""
    @State private var isSearchbarVisible = false
    
    
    var body: some View {
        ZStack{
            BackgroundAnimationView()
                .preferredColorScheme(.dark)
            NavigationStack {
                ScrollView(showsIndicators: false) {
                    Spacer()
                    LazyVStack(spacing: 10) {
                        ForEach(events) {
                            event in EventView(event: event)
                                .environment(\.colorScheme, .light)
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Image(systemName: "magnifyingglass")
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Events")
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            isSidebarOpened.toggle()
                        }, label: {
                            Image(systemName: "line.3.horizontal")
                        })
                    }
                }
                .navigationTitle("Events")
                .navigationBarTitleDisplayMode(.inline)
                .padding(.top)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(BackgroundAnimationView())
            }
            SideMenuView(isSidebarVisible: $isSidebarOpened)
        }
    }
}

#Preview {
    ContentView()
}
