//
//  ContentView.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
        ZStack(alignment: .top) {
            Navbar(
                title: "Home",
                leadingIcon: "magnifyingglass",
                trailingIcon: "person",
                LeadingDrawer: AnyView(SearchDrawer())
            )
        }
            Spacer()
            
            VStack {
                Text("Hello, World!")
                    .background(Color.red)
                    .frame(width: 200, height: 200)
              
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
