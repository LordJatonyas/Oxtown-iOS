//
//  OxtownApp.swift
//  Oxtown
//
//  Created by John Lee on 1/5/24.
//

import SwiftUI
import Firebase

/*
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
    return true
  }
}
 */

@main
struct OxtownApp: App {
    // register app delegate for Firebase setup
    // @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(dataManager)
                .preferredColorScheme(.light)
            /*
            MainView()
                .preferredColorScheme(.light)
            */
        }
    }
}
