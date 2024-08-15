//
//  OxtownApp.swift
//  Oxtown
//
//  Created by John Lee on 1/5/24.
//

import SwiftUI
import Firebase

@main
struct OxtownApp: App {
    // register app delegate for Firebase setup
    // @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var eventManager = EventManager()
    @StateObject var eventhostManager = EventHostManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(eventManager)
                .environmentObject(eventhostManager)
                .preferredColorScheme(.light)
        }
    }
}
