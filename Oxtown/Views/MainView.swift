//
//  MainView.swift
//  Oxtown
//
//  Created by John Lee on 19/5/24.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            Group {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                            .imageScale(.small)
                        Text("Home")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        Text("Search")
                    }
                AccountView()
                    .tabItem {
                        Image(systemName: "person")
                            .imageScale(.small)
                        Text("Account")
                    }
            }
            .toolbarBackground(.sand.opacity(0.9), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .tint(.pastelPurple)
    }
}

#Preview {
    MainView()
}
