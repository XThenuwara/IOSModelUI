//
//  DisplayCardOneExpandable.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-30.
//

import SwiftUI

struct DisplayCardExpandOne: View {
    @State var showExpanded: Bool = false
    
    var title: String = "Display Card Expand One"
    var description: String? = "A simple display card with an image and text"
    var image: String? = "https://picsum.photos/200/300"
    var actionText: String? = "Action"
    var expandCard: ExpandCardType?;
    
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                AsyncImage(url: URL(string: ((image != nil) ? image : "") ?? "")) { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    Text(description ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            HStack {
                Spacer()
                Button(action: {
                    showExpanded.toggle()
                }) {
                    Text(actionText ?? "")
                        .fontWeight(.bold)
                        .font(.system(size: 12))
                        .padding(.leading, 8)
                        .padding(.trailing, 8)
                        .padding(4)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
        .sheet(isPresented: $showExpanded) {
            ExpandedCardView(title: title, description: description, image: ["https://picsum.photos/200/300"])
        }
    }
}



#Preview {
    DisplayCardExpandOne(title: "Display Card Expand One")
}
