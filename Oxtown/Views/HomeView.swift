//
//  HomeView.swift
//  Oxtown
//
//  Created by John Lee on 9/5/24.
//

import SwiftUI

struct HomeView: View {
    
    var segmentWidth = UIScreen.main.bounds.size.width * 0.7
    
    
    @State private var selectedFilters: Set<String> = []
    @State private var filters = ["Hackathons", "BOPs", "Balls"]
    @State private var isFilterbarOpened = false
    
    @State private var overallView = "Home"
    @State private var mainviews = ["Home", "My Account"]
    
    @State private var defaultView = "Featured"
    @State private var views = ["Browse", "Featured", "My Events"]

    @State private var isSearchbarOpened = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.mint.opacity(0.6), .coralPink.opacity(0.7)], startPoint: .leading, endPoint: .trailing)
                    .ignoresSafeArea()
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
                            .colorMultiply(.sand)
                            .pickerStyle(.segmented)
                            .frame(width: segmentWidth)
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink(destination: SearchView(), label: {
                                Image(systemName: "magnifyingglass")
                                .foregroundStyle(.sand)})
                            /*
                            Button(action: {
                                withAnimation(.linear(duration: 0.1)) {
                                    isSearchbarOpened.toggle()
                                }
                            }, label: {
                                Image(systemName: "magnifyingglass")
                                    .tint(.sand)
                            })
                            */
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(.hidden, for: .navigationBar)
                
                VStack{
                    Spacer()
                    
                    TabView(selection: $defaultView) {
                        BrowseView()
                            .tag(views[0])
                        FeaturedView()
                            .tag(views[1])
                        MyEventsView()
                            .tag(views[2])
                    }
                    .ignoresSafeArea()
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
                
                
            }
        }
        .tint(.sand)
    }
}


struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        @StateObject var eventManager = EventManager()
        HomeView()
            .environmentObject(eventManager)
    }
}
