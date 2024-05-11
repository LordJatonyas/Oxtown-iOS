//
//  Tag.swift
//  Oxtown
//
//  Created by John Lee on 10/5/24.
//

import Foundation

struct Tag: Identifiable {
    var id = UUID()
    let title: String
    let emoji: String
}
