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
    
    let databaseController = DatabaseController()
    let networkController = NetworkController()
    
    init(users: [User], posts: [Post]?, comments: [Comment]?) {
        self.users = users
        self.posts = posts
        self.comments = comments
    }
    
    func fetchData() {
        //call fetch local database first
        //if no users, fetch data from network & update realm + new users = self.users
        //if we do have local users, display them on the screen
        //then do networking?
        
        
    }
}
