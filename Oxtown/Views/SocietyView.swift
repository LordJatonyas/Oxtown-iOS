//
//  SocietyView.swift
//  Oxtown
//
//  Created by John Lee on 18/5/24.
//

import SwiftUI

struct SocietyView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationStack {
            ForEach(dataManager.events) {
                event in
                Text("Hello")
            }
            .navigationTitle("Events")
        }
    }
}

#Preview {
    SocietyView()
}
