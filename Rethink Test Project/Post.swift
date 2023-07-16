//
//  Post.swift
//  Rethink Test Project
//
//  Created by Zion Tuiasoa on 7/14/23.
//

import Foundation

struct Post: ListItemConvertable, Codable {
    let userID: Int
    let id: Int
    let title: String
    let body: String
    var comments: [Comment]?

    func asListItem() -> ListItem {
        ListItem(itemType: .post(self), children: comments?.map { $0.asListItem() })
    }
}

extension Post {
    static let samples = [
        Post(userID: 1, id: 1, title: "title", body: "body test", comments: Comment.sample)
    ]
}
