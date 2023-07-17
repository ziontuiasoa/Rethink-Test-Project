//
//  Comment.swift
//  Rethink Test Project
//
//  Created by Zion Tuiasoa on 7/14/23.
//

import Foundation
import RealmSwift

class Comment: ListItemConvertable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String

    init(postId: Int, id: Int, name: String, email: String, body: String) {
        self.postId = postId
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }
    
    func asListItem() -> ListItem {
        let email = self.email.asListItem()
        return ListItem(itemType: .comment(self), children: [email])
    }
}

extension Comment {
    static let sample = [Comment(postId: 1, id: 1, name: "comment name", email: "email", body: "comment body")]
}

struct CommentResponse: Codable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
