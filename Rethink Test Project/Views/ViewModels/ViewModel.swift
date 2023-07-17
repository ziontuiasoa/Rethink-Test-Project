//
//  ViewModel.swift
//  Rethink Test Project
//
//  Created by Zion Tuiasoa on 7/12/23.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var users: [User]?
    @Published var postsCount: Int = 0
    @Published var commentsCount: Int = 0
    
    let networkController = NetworkController()
    
    @MainActor
    func fetchData() async {
        async let commentsResponse = try? await networkController.fetchComments()
        async let postsResponse = try? await networkController.fetchPosts()
        async let usersResponse = try? await networkController.fetchUsers()
        
        postsCount = await postsResponse?.count ?? 0
        commentsCount = await commentsResponse?.count ?? 0

        let users = await usersResponse?.map { User(id: $0.id, name: $0.name, username: $0.username, email: $0.email, posts: nil) }
        let posts = await postsResponse?.map { Post(userId: $0.userId, id: $0.id, title: $0.title, body: $0.body, comments: nil) }
        let comments = await commentsResponse?.map { Comment(postId: $0.postId, id: $0.id, name: $0.name, email: $0.email, body: $0.body) }

        self.users = users?.map { user in
            let usersPosts = posts?.filter { $0.userId == user.id }.map { post in
                let postsComments = comments?.filter { $0.postId == post.id }
                post.comments = postsComments
                return post
            }
            
            user.posts = usersPosts
            return user
        }
    }
}
