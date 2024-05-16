//
//  WebsiteView.swift
//  Oxtown
//
//  Created by John Lee on 15/5/24.
//

import SwiftUI

struct WebsiteView: View {
    @Binding var url: String
    var body: some View {
        SFSafariViewWrapper(url: URL(string: url)!)
    }
}
