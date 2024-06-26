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
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
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
                
                HStack {
                    Text("For me")
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
                
                HStack {
                    Text("More")
                        .font(.custom("Avenir", size: 25))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.black)
                        .padding(.leading)
                    Spacer()
                }
                LazyVStack(spacing: 10) {
                    ForEach(eventManager.events, id: \.id) {
                        event in
                        EventIconRect(event: event)
                    }
                }.padding(.bottom)
            }
            .scrollIndicators(.hidden)
            .refreshable{ eventManager.fetchEvents() }
        }
        .ignoresSafeArea()
        .searchable(text: $searchtext)
        .tint(.black)
    }
}
