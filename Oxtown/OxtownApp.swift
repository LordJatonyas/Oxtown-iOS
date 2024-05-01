//
//  OxtownApp.swift
//  Oxtown
//
//  Created by John Lee on 1/5/24.
//
import SwiftUI

@main
struct RavinoxApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                BackgroundAnimationView()
                ContentView()
            }
        }
    }
}
