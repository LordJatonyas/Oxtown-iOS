//
//  MainView.swift
//  Oxtown
//
//  Created by John Lee on 19/5/24.
//

import SwiftUI

struct MainView: View {
    
    @State var isLoading: Bool = true
    
    var body: some View {
        ZStack {
            TabView {
                Group {
                    BrowseView()
                        .tabItem {
                            Image(systemName: "compass.drawing")
                                .imageScale(.small)
                            Text("Browse")
                        }
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                            Text("Search")
                        }
                    MyEventsView()
                        .tabItem {
                            Image(systemName: "ticket.fill")
                                .imageScale(.small)
                            Text("My Events")
                        }
                    AccountView()
                        .tabItem {
                            Image(systemName: "person")
                                .imageScale(.small)
                            Text("Account")
                        }
                }
                .toolbarBackground(.black, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            }
            .tint(.sand)
            
            if isLoading {
                LoadingView()
            }
        }
        .onAppear{ startFakeNetworkCall() }
    }
    
    func startFakeNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
        }
    }
}
