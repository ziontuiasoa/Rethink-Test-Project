//
//  ViewModel.swift
//  Rethink Test Project
//
//  Created by Zion Tuiasoa on 7/12/23.
//

import Foundation

class ViewModel {
    
    var users: [User]
    var posts: [Post]?
    var comments: [Comment]?
    
    init(users: [User], posts: [Post]?, comments: [Comment]?) {
        self.users = users
        self.posts = posts
        self.comments = comments
    }
}
