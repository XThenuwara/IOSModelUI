//
//  DisplayCardTwo.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-30.
//
import SwiftUI

// Vertical Card
struct DisplayCardTwo: View {
    var title: String = "Display Card One"
    var description: String? = "A simple display card with an image and text";
    var image: String? = "https://picsum.photos/400/100"
    var actionText : String? = "Action"
    var action: () -> Void = { }
    
    @State var isLoading: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: ((image != nil) ? image : "") ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: .infinity, height: 100)
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
            }
            HStack{
                Spacer()
                Button(action: {
                    isLoading = true;
                    action()
                    isLoading = false;
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
    }
    
}


#Preview {
    DisplayCardTwo(
        title: "Display Card One"
    )
}
