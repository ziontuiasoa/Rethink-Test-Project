//
//  User.swift
//  Rethink Test Project
//

import Foundation

struct User: ListItemConvertable, Codable {
    let id: Int
    var name: String
    var username: String
    var email: String
    var posts: [Post]?
    
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
