//
//  Post.swift
//  Rethink Test Project
//
//  Created by Zion Tuiasoa on 7/14/23.
//

import Foundation
import RealmSwift

class Post: ListItemConvertable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    var comments: [Comment]?
    
    init(userId: Int, id: Int, title: String, body: String, comments: [Comment]?) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
        self.comments = comments
    }

    func asListItem(_ additionalItems: [ListItem]? = nil) -> ListItem {
        ListItem(itemType: .post(self), children: comments?.map { $0.asListItem() })
    }
}

extension Post {
    static let samples = [
        Post(userId: 1, id: 1, title: "title", body: "body test", comments: Comment.sample)
    ]
}

struct PostReponse: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
