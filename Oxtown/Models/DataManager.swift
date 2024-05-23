//
//  ViewController.swift
//  Oxtown
//
//  Created by John Lee on 21/5/24.
//

import Firebase

class DataManager: ObservableObject {
    @Published var events: [Event] = []
    
    init() {
        fetchEvents()
    }
    
    func fetchEvents() {
        events.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("events")
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
                    let title = data["title"] as! String
                    let time = data["time"] as! Timestamp
                    let details = data["description"] as! String
                    let host_id = data["host_id"] as! [String]
                    let location = data["location"] as! GeoPoint
                    let address = data["address"] as! String
                    let website = data["website"] as! String
                    
                    
                    
                    let event = Event(id: id,
                                      image: image_link,
                                      title: title,
                                      time: time,
                                      address: address,
                                      location: location,
                                      details: details,
                                      website: website,
                                      hostID: host_id
                                      )
                    
                    print(time)
                    self.events.append(event)
                }
            }
        }
    }
}

/*

 struct Event: Codable, Identifiable {
     var id: String
     var image: String
     var title: String
     var time: String
     var address: String
     var long: Float
     var lat: Float
     var details: String
     var website: String
     var hostID: [String]
 }


*/
