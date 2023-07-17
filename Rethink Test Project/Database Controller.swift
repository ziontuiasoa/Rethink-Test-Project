//
//  Database Controller.swift
//  Rethink Test Project
//
//  Created by Braden Hartley on 7/16/23.
//

import Foundation
import RealmSwift
import Realm

class DatabaseController {
    let realm = try! Realm()
    var token: NotificationToken?
    
    func save(users: [User]) {
        try! realm.write {
            realm.add(users)
        }
    }
    
    func delete(at index: Int) {
        let user = getUsers()[index]
        
        try! realm.write {
            realm.delete(user)
        }
        update()
    }
    
    func getUsers() -> [User] {
        Array(realm.objects(User.self))
    }
    
    func insert() {
    }
    
    func update() {
        let users = getUsers()
        
    
        //deleting users
        //creating new users
        //check for changes & update realm with networking changes
        
//        let user = users[]
//        try! realm.write {
//            users.status = "InProgress"
//        }
    }
}
