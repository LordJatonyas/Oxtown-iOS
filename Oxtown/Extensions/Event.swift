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
    var location: GeoPoint
    var details: String
    var website: String
    var hostID: [String]
}


/*
extension Event {
    func add(image: String, title: String, start_time: String, end_time: String, distance: Int32 = -1, free: Bool = true, available: Bool = true, website: String) -> Event {
        
        return Event(image: image, title: title, start_time: start_time, end_time: end_time, distance: distance, free: free, available: available, website: website)
    }
}
*/

