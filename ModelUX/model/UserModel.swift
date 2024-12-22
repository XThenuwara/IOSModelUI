//
//  UserModel.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-22.
//
import SwiftUI

class UserModel: ObservableObject {
    
    @Published var currentUser: UserProfile?
    @Published var currentUserAuthorization: UserAuthorization?
}
