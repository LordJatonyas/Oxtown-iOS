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
            
            if isLoading {
                LoadingView()
            }
        }
        .onAppear{ startFakeNetworkCall() }
    }
    
    func startFakeNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }
}

/*
#Preview {
    MainView()
        .environmentObject(DataManager)
}
*/
