//
//  User.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-22.
//

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
