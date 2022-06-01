//
//  ApiManager.swift
//  ApiPractice
//
//  Created by Diana on 29/05/2022.
//

import Foundation


enum ApiType {
    
    case login
    case getUsers
    case getPosts
    case getAlbums
    
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    
    var headers: [String : String] {
        switch self {
        case .login:
            return ["authToker" : "12345"]
        default:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .login: return "login"
        case .getUsers: return "users"
        case .getPosts: return "posts"
        case .getAlbums: return "albums"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseURL)!)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        
        switch self {
        case .login:
            request.httpMethod = "POST"
            return request
        default:
            request.httpMethod = "GET"
            return request
        }
    }
}

class ApiManager {

    static let shared = ApiManager()
    
    func getUsers(complition: @escaping (Users) -> Void) {
        let request = ApiType.getUsers.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let users = try? JSONDecoder().decode(Users.self, from: data){
                complition(users)
            } else {
                complition([])
            }
            
        }
        task.resume()
    }
    
    func getPosts(complition: @escaping (Posts) -> Void) {
        let request = ApiType.getPosts.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let posts = try? JSONDecoder().decode(Posts.self, from: data){
                complition(posts)
            } else {
                complition([])
            }
            
        }
        task.resume()
    }
    
    func getAlbums(complition: @escaping (Albums) -> Void) {
        let request = ApiType.getAlbums.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let albums = try? JSONDecoder().decode(Albums.self, from: data){
                complition(albums)
            } else {
                complition([])
            }
            
        }
        task.resume()
    }
}
