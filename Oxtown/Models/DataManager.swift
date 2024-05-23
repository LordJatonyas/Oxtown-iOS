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
                    var data = document.data()
                    
                    var id = data["id"] as? Int64 ?? -1
                    var image_link = data["image_link"] as? String ?? ""
                    var title = data["title"] as? String ?? ""
                    var start_time = data["start_time"] as? String ?? ""
                    var details = data["details"] as? String ?? ""
                    var type = data["type"] as? Bool
                    let
                    
                    
                    
                    let event = Event(id: id,
                                      image: image_link,
                                      title: title,
                                      start_time: start_time,
                                      details: details,
                                      
                                      )
                    self.events.append(event)
                    */
                }
            }
        }
    }
}

/*
struct Event: Codable, Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var start_time: String
    var details: String
    var free: Bool
    var available: Bool
    var website: String
}
*/
