//
//  ContentView.swift
//  oxery
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var events = [
        Event(image: "OPS", title: "Holotechnica", start_time: "03 May 1830H", end_time: "03 May 2000H", distance: 3, free: false, available: true, website: "https://www.instagram.com/p/C6bqE30idzq/"),
        Event(image: "starwars", title: "Star Wars Ice Hockey", start_time: "03 May 2215H", end_time: "04 May 0000H", distance: 1, free: false, available: true, website: "https://www.instagram.com/p/C6cQI-SIO3n/?img_index=1"),
        Event(image: "HMC_Summer", title: "HMC 2024 Summer Event", start_time: "03 May 1800H", end_time: "04 May 0200H", distance: 2, free: false, available: false, website: "https://bookoxex.com/Go/HMC2024SummerEvent"),
        Event(image: "Corpus_Christi_Ball", title: "CCC Ball 2024", start_time: "04 May 1900H", end_time: "", distance: 1, free: false, available: false, website: "https://bookoxex.com/Go/CorpusChristiCollegeBall2024"),
        Event(image: "OUAPS_Ball", title: "OUAPS Ball 2024", start_time: "10 May 2000H", end_time: "", distance: 0, free: false, available: true, website: "https://bookoxex.com/Go/OUAPSBall2024"),
    ]
    
    
    @State private var isSidebarOpened = false
    @State private var searchText = ""
    
    var body: some View {
        ZStack{
            BackgroundAnimationView()
            NavigationStack {
                ScrollView(showsIndicators: false) {
                    Spacer()
                    LazyVStack(spacing: 10) {
                        ForEach(events) {
                            event in EventView(event: event)
                        }
                    }
                }
                .searchable(text: $searchText, prompt: "Search event")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Image(systemName: "bus")
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
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.white.opacity(0.1), for: .navigationBar)
                .toolbarBackground(.visible, for: .bottomBar)
                .toolbarBackground(.white.opacity(0.8), for: .bottomBar)
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
