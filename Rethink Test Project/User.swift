//
//  User.swift
//  Rethink Test Project
//

import Foundation
import RealmSwift

class User: Object, ListItemConvertable, Codable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var posts: [Post]?
    
    init(id: Int, name: String, username: String, email: String, posts: [Post]?) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.posts = posts
    }
    
    func asListItem() -> ListItem {
        ListItem(itemType: .user(self), children: posts?.map { $0.asListItem() })
    }
}

extension User {
    static let samples = [
        User(id: 1, name: "bob", username: "username", email: "email", posts: Post.samples),
        User(id: 1, name: "amy", username: "username", email: "email", posts: Post.samples)
    ]
}
