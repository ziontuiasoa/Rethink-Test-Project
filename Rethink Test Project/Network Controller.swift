//
//  Network Controller.swift
//  Rethink Test Project
//
//  Created by Zion Tuiasoa on 7/14/23.
//

import Foundation

class NetworkController {
//    static let shared = NetworkController()

    private let baseURL = "https://jsonplaceholder.typicode.com"
    private let session: URLSession

    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        session = URLSession(configuration: configuration)
    }
    
    enum Endpoint {
        case user
        case post
        case comment
    }

    func buildURL(for endpoint: Endpoint) throws -> URL {
        var urlString: String
        switch endpoint {
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
    
    func fetchData(for endpoint: Endpoint) async throws -> [Any] {
        let url = try buildURL(for: endpoint)
        // Use the async variant of URLSession to fetch data
        // Code might suspend here
        let (data, _) = try await URLSession.shared.data(from: url)

        // Parse the JSON data
        
        switch endpoint {
        case .user:
            let dataPoint = try JSONDecoder().decode(User.self, from: data)
        case .post:
            Post.self
        case .comment:
            Comment.self
        }
        
        return dataPoint.result
    }
//
//    func fetchData<T: Decodable>(for endpoint: Endpoint, completion: (Result<T, Error>)) {
//        let url = buildURL(for: endpoint)
//        let task = session.dataTask(with: url) { data, response, error in
//            if let error = error {
//
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(NetworkError.noData))
//            }
//
//            do {
//                let decodedData = try JSONDecoder().decode(T.self, from: data)
//                completion(.success(decodedData))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//        task.resume
//    }
//}

enum NetworkError: Error {
    case noData
}


//class NetworkController {
//    static let shared = NetworkController()
//
//    private let baseURL = "https://jsonplaceholder.typicode.com"
//    private let session: URLSession
//
//    private init() {
//        let configuration = URLSessionConfiguration.default
//        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
//        session = URLSession(configuration: configuration)
//    }
//
//    func fetchUsers() async throws -> [User] {
//        let url = URL(string: baseURL + "/users")!
//        let (data, _) = try await session.data(from: url)
//        return try JSONDecoder().decode([User].self, from: data)
//    }
//
//    func fetchPosts() async throws -> [Post] {
//        let url = URL(string: baseURL + "/posts")!
//        let (data, _) = try await session.data(from: url)
//        return try JSONDecoder().decode([Post].self, from: data)
//    }
//
//    func fetchComments() async throws -> [Comment] {
//        let url = URL(string: baseURL + "/comments")!
//        let (data, _) = try await session.data(from: url)
//        return try JSONDecoder().decode([Comment].self, from: data)
//    }
//}


