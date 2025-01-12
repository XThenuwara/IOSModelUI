//
//  GitHubCard.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2025-01-12.
//
import SwiftUI

public struct GitHubCard: View {
    
    @State private var user: GitHubUser?

    public var body : some View {
        VStack {
            VStack {
                HStack {
                    URLImage(url: user?.avatarUrl ?? "", imageConfig: ImageConfig(
                        contentMode: .fill,
                        cornerRadius: 600,
                        width: 100,
                        height: 100
                    ))
                        
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text(user?.name ?? "Github User name")
                                .bold()
                                .font(.title2)
                            Text(user?.login ?? "Github User login")
                                .font(.caption)
                            
                        }
                        
                    }
                }
                Spacer()
                Text(user?.bio ?? "Github User bio")
                    .font(.footnote)
            }
            .frame(height: 170)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.mutedBackground)
                .cornerRadius(15)
                .padding(10)
                .cornerRadius(10)
            
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 10),GridItem(.flexible(), spacing: 10)]) {
                VStack {
                    Text("Followers")
                        .bold()
                        .foregroundStyle(.secondary)
                    Text(String(user?.followers ?? 0))
                        .bold()
                }
                .padding()
                VStack {
                    Text("Following")
                        .bold()
                        .foregroundStyle(.secondary)
                    Text(String(user?.following ?? 0))
                        .bold()
                }.padding()
                VStack {
                    Text("Public Repos")
                        .bold()
                        .foregroundStyle(.secondary)
                    Text(String(user?.publicRepos ?? 0))
                        .bold()
                }.padding()
                VStack{
                    Text("User Type")
                        .bold()
                        .foregroundStyle(.secondary)
                    Text(user?.type ?? "")
                        .bold()
                }.padding()
            }
    
            Spacer()
        }.task {
            do {
                user = try await GitHubUserService().getGithubUser(username: "xthenuwara");
            } catch NetworkError.invalidURL {
                print("Invalid URL")
            } catch NetworkError.invalidResponse {
                print("Invalid Response")
            } catch NetworkError.invalidData {
                print("Invalid Data")
            } catch {
                print ("Error: \(error)")
            }
        }
    }
}


#Preview {
    GitHubCard()
}
