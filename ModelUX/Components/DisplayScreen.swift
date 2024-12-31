//
//  DisplayScreen.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-30.
//

import SwiftUI

struct DisplayScreen: View {
    
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())], spacing: 10) {
                    DisplayCardOne(title: "Test")
                    DisplayCardTwo(title: "Test")
                    DisplayCardTwo(title: "Test")
                    DisplayCardTwo(title: "Test")
                    DisplayCardTwo(title: "Test")
                    DisplayCardTwo(title: "Test")
                    
                }
            }
            Spacer()
        }.padding()
    }
    
}


#Preview {
    DisplayScreen()
}
