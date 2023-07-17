//
//  Comment.swift
//  Rethink Test Project
//
//  Created by Zion Tuiasoa on 7/14/23.
//

import Foundation
import RealmSwift

class Comment: Object, ListItemConvertable, Codable {
    
    var id: Int
    var postId: Int
    var name: String
    var email: String
    var comment: String
    var body: String

    init(id: Int, postId: Int, name: String, email: String, comment: String, body: String) {
        self.id = id
        self.postId = postId
        self.name = name
        self.email = email
        self.comment = comment
        self.body = body
    }
    
    func asListItem() -> ListItem {
        let email = self.email.asListItem()
        return ListItem(itemType: .comment(self), children: [email])
    }
}

extension Comment {
    static let sample = [Comment(id: 1, postId: 1, name: "comment name", email: "email", comment: "comment", body: "comment body")]
}

extension String: ListItemConvertable {
    func asListItem() -> ListItem {
        ListItem(itemType: .info(self))
    }
}
