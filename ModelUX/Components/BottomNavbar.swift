//
//  BottomNavbar.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-22.
//

import SwiftUI


struct BottomNavbar: View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem { Image(systemName: "house") }
            Text("Profile")
                .tabItem { Image(systemName: "person") }
        }
    }
}


#Preview {
    BottomNavbar()
}
