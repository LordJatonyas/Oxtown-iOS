//
//  ContentView.swift
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI

struct BrowseView: View {
    
    @EnvironmentObject var eventManager: EventManager
    @State private var showfullevent: Bool = false
    @State private var searchtext: String = ""
    
    // @State var explore_events: [Event] = dataManager.events
    
    var body: some View {
        if eventManager.events.isEmpty {
            ContentUnavailableView(label: {
                Label("No Events", systemImage: "xmark")
            }, description: {
                Text("We're working on it!")
            })
        } else {
            NavigationStack {
                ScrollView {
                    
                    LazyVStack(spacing: 10) {
                        ForEach(eventManager.events, id: \.id) {
                            event in
                            EventIconRect(event: event)
                        }
                    }.padding(.bottom)
                    
                    HStack {
                        Text("Featured")
                            .font(.custom("Avenir", size: 25))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.black)
                            .padding(.leading)
                        Spacer()
                    }
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 8) {
                            ForEach(eventManager.events, id: \.id) {
                                event in
                                EventIconSmall(event: event)
                            }
                        }.padding([.leading, .trailing])
                    }
                }
                .scrollIndicators(.hidden)
                .refreshable{ eventManager.fetchEvents() }
            }
            .ignoresSafeArea()
            .searchable(text: $searchtext)
        }
    }
}
