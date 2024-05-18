//
//  OxtownApp.swift
//  Oxtown
//
//  Created by John Lee on 1/5/24.
//

import SwiftUI
import SwiftData
import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
    return true
  }
}

@main
struct OxtownApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    let event_container: ModelContainer = {
        let event_schema = Schema([Event.self])
        let event_container = try! ModelContainer(for: event_schema, configurations: [])
        return event_container
    }()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.light)
        }
        .modelContainer(event_container)
    }
}
