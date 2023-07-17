//
//  Network Controller.swift
//  Rethink Test Project
//
//  Created by Zion Tuiasoa on 7/14/23.
//

import Foundation


class NetworkController {
    private let baseURL = "https://jsonplaceholder.typicode.com"
    private let session: URLSession
    
    enum DataType {
        case user
        case post
        case comment
    }
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        session = URLSession(configuration: configuration)
    }
    
    func buildURL(for dataType: DataType) throws -> URL {
        var urlString: String
        switch dataType {
        case .user:
            urlString = baseURL + "/users"
        case .post:
            urlString = baseURL + "/posts"
        case .comment:
            urlString = baseURL + "/comments"
        }
        guard let url = URL(string: urlString) else {
            throw NetworkError.noData
        }
        return url
    }
    
    func fetchUsers() async throws -> [UserResponse] {
        let url = try buildURL(for: .user)
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let usersResult = try JSONDecoder().decode([UserResponse].self, from: data)
        return usersResult
    }
    
    func fetchPosts() async throws -> [PostReponse] {
        let url = try buildURL(for: .post)
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let postsResult = try JSONDecoder().decode([PostReponse].self, from: data)
        return postsResult
    }
    
    func fetchComments() async throws -> [CommentResponse] {
        let url = try buildURL(for: .comment)
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let commentsResult = try JSONDecoder().decode([CommentResponse].self, from: data)
        return commentsResult
    }
}

enum NetworkError: Error {
    case noData
}
