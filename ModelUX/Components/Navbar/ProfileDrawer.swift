//
//  ProfileDrawer.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-22.
//
import SwiftUI


struct ProfileDrawer: View {
    @State var userProfile: UserProfile
    
    var body: some View {
        VStack {
            
        }
    }
}

#Preview {
    ProfileDrawer(userProfile: UserProfile(id: 1, name: "Yasas Hansaka Thenuwara", email: "xthenuwara@gmail.com", avatar: "z"))
}
