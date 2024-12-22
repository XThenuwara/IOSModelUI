//
//  SearchDrawer.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-22.
//
import SwiftUI

struct SearchDrawer : View {
    @State var searchText: String = ""
    
    
    var body : some View {
        VStack {
            TextField("Search", text: $searchText)
                .padding()
                .background(Color.mutedBackground)
                .cornerRadius(10)
                .padding()
            
        }
    }
    
}


#Preview {
    SearchDrawer()
}
