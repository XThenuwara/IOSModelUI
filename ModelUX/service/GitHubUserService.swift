//
//  GitHubUserService.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2025-01-12.
//
import Foundation

class GitHubUserService {
    let endpoint = "https://api.github.com/users"
    
    func getGithubUser(username: String) async throws -> GitHubUser {
        // url
        guard let url = URL(string: self.endpoint + "/" + username) else {
            throw NetworkError.invalidURL
        }
        
        // fetch data
        let (data, response) = try await URLSession.shared.data(from: url)
        
        
        
        // validate response
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        // transform the reponse
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase;
            decoder.dateDecodingStrategy = .iso8601
            let githubUser = try decoder.decode(GitHubUser.self, from: data)
        
            return githubUser;
        } catch {
            throw NetworkError.invalidData
        }
    }
}

