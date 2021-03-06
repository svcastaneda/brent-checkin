//
//  Report.swift
//  Check In
//
//  Created by Saundra Castaneda on 2/22/18.
//  Copyright © 2018 DePaul University. All rights reserved.
//

import Foundation
import Firebase

struct Report {
    
    let key: String
    let mood: String
    let addedByUser: String
    let ref: DatabaseReference?
    let description: String
    let created_at: TimeInterval
    
    init(mood: String, addedByUser: String, description: String, created_at: Double, key: String = "") {
        self.key = key
        self.mood = mood
        self.addedByUser = addedByUser
        self.description = description
        self.created_at = created_at
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        mood = snapshotValue["mood"] as! String
        addedByUser = snapshotValue["addedByUser"] as! String
        description = snapshotValue["description"] as! String
        created_at = snapshotValue["created_at"] as! TimeInterval
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "mood": mood,
            "addedByUser": addedByUser,
            "description": description,
            "created_at": created_at
        ]
    }
    
}
