//
//  SocietyView.swift
//  Oxtown
//
//  Created by John Lee on 18/5/24.
//

import SwiftUI

struct SocietyView: View {
    @EnvironmentObject var eventManager: EventManager
    
    var body: some View {
        NavigationStack {
            ForEach(eventManager.events) {
                event in
                Text("Hello")
            }
            .navigationTitle("Events")
        }
    }
}

#Preview {
    Text("Hello World")
    // SocietyView()
}
