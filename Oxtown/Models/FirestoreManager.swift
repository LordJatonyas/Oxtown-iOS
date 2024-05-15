//
//  FirestoreManager.swift
//  Oxtown
//
//  Created by John Lee on 13/5/24.
//

import FirebaseFirestore

struct FirestoreManager {
    let db = Firestore.firestore()
    
    func readData() {
        db.collection("events").getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if let documents = querySnapshot?.documents {
                    for document in documents {
                        print("\(document.documentID): \(document.data())")
                    }
                } else {
                    print("Error getting documents")
                }
            }
        }
    }
    
    func writeData() {
        let data: [String: Any] = ["key" : "value"]
        db.collection("events").addDocument(data: data) { (error) in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document written successfully!")
            }
        }
    }
}
