//
//  Event.swift
//  Oxtown
//
//  Created by John Lee on 1/5/24.
//

import Foundation
import Firebase

struct Event: Codable, Identifiable {
    var id: String
    var image: String
    var title: String
    var time: Timestamp
    var address: String
    var location: GeoPoint?
    var details: String
    var website: String
    var hostID: [String]
}
