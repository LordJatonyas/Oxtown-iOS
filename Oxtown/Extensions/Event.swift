//
//  Event.swift
//  Oxtown
//
//  Created by John Lee on 1/5/24.
//

import Foundation
import SwiftData

@Model
class Event {
    var image: String
    var title: String
    var start_time: String
    var distance: Int
    var free: Bool
    var available: Bool
    var website: String
    
    init(image: String, title: String, start_time: String, distance: Int, free: Bool, available: Bool, website: String) {
        self.image = image
        self.title = title
        self.start_time = start_time
        self.distance = distance
        self.free = free
        self.available = available
        self.website = website
    }
}



/*
extension Event {
    func add(image: String, title: String, start_time: String, end_time: String, distance: Int32 = -1, free: Bool = true, available: Bool = true, website: String) -> Event {
        
        return Event(image: image, title: title, start_time: start_time, end_time: end_time, distance: distance, free: free, available: available, website: website)
    }
}
*/

