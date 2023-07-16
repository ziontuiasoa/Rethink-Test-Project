//
//  Network Controller.swift
//  Rethink Test Project
//
//  Created by Zion Tuiasoa on 7/14/23.
//

import Foundation

class NetworkController {
    static let shared = NetworkController()

    private let baseURL = "https://jsonplaceholder.typicode.com"
    private let itemType: ItemType
    private let session: URLSession

    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        session = URLSession(configuration: configuration)
    }
    
    func buildURL(for itemType: ItemType) throws -> URL {
        var urlString: String
        switch itemType {
        case .user:
            urlString = baseURL + "/users"
        case .post:
            urlString = baseURL + "/posts"
        case .comment:
            urlString = baseURL + "/comments"
        default:
            break
        }
        return try URL(string: urlString)
    }

    func fetchData<T: Decodable>(for itemType: ItemType, completion: (Result, Error)) {
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume
    }
}

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


