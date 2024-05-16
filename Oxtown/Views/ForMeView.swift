//
//  SwiftUIView.swift
//  Oxtown
//
//  Created by John Lee on 16/5/24.
//

import SwiftUI

struct ForMeView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            Spacer()
            LazyVStack(spacing: 10) {
                ForEach(forme_events, id: \.self) {
                    event in EventIcon(event: event)
                        .environment(\.colorScheme, .light)
                }
            }
        }
    }
}

#Preview {
    ForMeView()
}
