//
//  Event_Host.swift
//  Oxtown
//
//  Created by John Lee on 28/5/24.
//

import Foundation
import Firebase

struct EventHost: Codable, Identifiable, Hashable {
    var id: String
    var image: String?
    var name: String
    var address: String
    var location: GeoPoint
    var details: String
    var type: [String]
    var website: String
}
