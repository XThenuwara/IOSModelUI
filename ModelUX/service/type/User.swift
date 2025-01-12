//
//  User.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-22.
//
import Foundation

struct UserProfile: Identifiable {
    let id: Int
    let name: String
    let email: String
    let avatar: String
}

struct UserAuthorization: Identifiable {
    let id: Int
    let authToken: String
    let refreshToken: String?
}

struct GitHubUser: Codable {
    let id: Int
    let login: String
    let name: String?
    let avatarUrl: String
    let bio: String?
    let followers: Int
    let following: Int
    let publicRepos: Int
    let createdAt: Date
    let updatedAt: Date
    
    // Optional fields for flexibility
    let company: String?
    let blog: String?
    let location: String?
    let email: String?
    let hireable: Bool?
    
    // Additional fields from the response (if needed)
    let nodeId: String?
    let type: String?
    let siteAdmin: Bool?
}
