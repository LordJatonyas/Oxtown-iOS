//
//  EventHostManager.swift
//  Oxtown
//
//  Created by John Lee on 28/5/24.
//

import Firebase

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
                    let image_link = data["image"] as! String
                    let name = data["title"] as! String
                    let details = data["description"] as! String
                    let location = data["location"] as! GeoPoint
                    let address = data["address"] as! String
                    let website = data["website"] as! String
                    
                    
                    let event_host = EventHost(id: id,
                                      image: image_link,
                                      name: name,
                                      address: address,
                                      location: location,
                                      details: details,
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
