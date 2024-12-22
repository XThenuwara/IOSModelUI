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
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 10)], spacing: 10) {
                    ForEach(0..<20) { index in
                        // full width buttons
                        Button(action: {
                            // do something
                        }) {
                            HStack {
                                Text("Item \(index)")
                                    .font(.headline)
                                    .foregroundColor(Color.text)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.primary)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                        }
                    }
                }
            }.padding()
        }
        .navigationTitle("Search")
        
    }
    
}


#Preview {
    SearchDrawer()
}
