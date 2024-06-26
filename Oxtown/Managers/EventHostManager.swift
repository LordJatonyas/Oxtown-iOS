//
//  EventHostManager.swift
//  Oxtown
//
//  Created by John Lee on 28/5/24.
//

import Firebase
import SwiftUI

class EventHostManager: ObservableObject {
    @Published var eventhosts: [String : EventHost] = [:]
    
    init() {
        fetchEventHosts()
    }
    
    func fetchEventHosts() {
        eventhosts.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("event_hosts")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = document.documentID
                    let image_link = data["image"] as? String ?? ""
                    let name = data["name"] as! String
                    let details = data["description"] as! String
                    let location = data["location"] as! GeoPoint
                    let address = data["address"] as! String
                    let website = data["website"] as! String
                    let host_types = data["type"] as! [String: Bool]
                    var host_type: [String] = []
                    if host_types["college"]! { host_type.append("college")}
                    if host_types["department"]! { host_type.append("department")}
                    if host_types["other"]! { host_type.append("other")}
                    if host_types["society"]! { host_type.append("society")}
                    
                    
                    
                    let event_host = EventHost(id: id,
                                      image: image_link,
                                      name: name,
                                      address: address,
                                      location: location,
                                      details: details,
                                      type: host_type,
                                      website: website
                                      )
                    
                    self.eventhosts[event_host.id] = event_host
                }
            }
        }
    }
}

/*
 struct EventHost: Codable, Identifiable, Hashable {
     var id: String
     var image: String
     var name: String
     var address: String
     var location: GeoPoint
     var details: String
     var website: String
 }
 */
