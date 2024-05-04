//
//  Event.swift
//  Ravinox
//
//  Created by John Lee on 1/5/24.
//

import Foundation

struct Event: Identifiable {
    var id = UUID()
    let image: String
    let title: String
    let start_time: String
    let distance: Int32
    var free = true
    var available = true
    var website: String
}

/*
extension Event {
    func add(image: String, title: String, start_time: String, end_time: String, distance: Int32 = -1, free: Bool = true, available: Bool = true, website: String) -> Event {
        
        return Event(image: image, title: title, start_time: start_time, end_time: end_time, distance: distance, free: free, available: available, website: website)
    }
}
*/

