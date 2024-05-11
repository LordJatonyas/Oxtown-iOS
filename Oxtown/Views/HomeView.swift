//
//  HomeView.swift
//  Oxtown
//
//  Created by John Lee on 9/5/24.
//

import SwiftUI

struct HomeView: View {
    var segmentWidth = UIScreen.main.bounds.size.width * 0.5
    
    @State private var selectedFilters: Set<String> = []
    @State private var filters = ["Hackathons", "BOPs", "Balls"]
    @State private var isFilterbarOpened = false
    
    @State private var defaultView = "Explore"
    var views = ["Explore", "My Events"]

    @State private var isSearchbarOpened = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                BackgroundAnimationView()
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            
                            Button(action: {
                                isFilterbarOpened.toggle()
                            }, label: {Image(systemName: "slider.horizontal.3")
                                    .foregroundStyle(.sand)
                                    .popover(isPresented: $isFilterbarOpened) {
                                        FiltersView(show: $isFilterbarOpened)
                                    }
                            })
                        }
                        ToolbarItem(placement: .principal) {
                            Picker("Change View", selection: $defaultView) {
                                ForEach(views, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.segmented)
                            .frame(width: segmentWidth)
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                                withAnimation(.linear(duration: 0.1)) {
                                    isSearchbarOpened.toggle()
                                }
                            }, label: {
                                Image(systemName: "magnifyingglass")
                                    .tint(.sand)
                            })
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(.hidden, for: .navigationBar)
                
                VStack{
                    if isSearchbarOpened {
                        SearchBar(text: $searchText, title: "Search")
                    }
                    Spacer()
                    TabView(selection: $defaultView) {
                        ExploreEventsView()
                            .tag(views[0])
                        MyEventsView()
                            .tag(views[1])
                    }
                    .ignoresSafeArea()
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
