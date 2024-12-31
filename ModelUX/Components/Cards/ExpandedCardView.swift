//
//  ExpandedCardView.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-30.
//
import SwiftUI;


struct ExpandedCardView: View {
    var title: String
    var description: String?
    var image: [String]?

        @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        VStack {
            if let images = image, !images.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(images, id: \.self) { imageUrl in
                            AsyncImage(url: URL(string: imageUrl)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 300, height: 400)
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 300, height: 200)
                            }
                        }
                    }
                }
                .frame(height: 400)
            } else {
                Text("No Images Available")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .frame(height: 220)
            }
        
            VStack(alignment: .leading) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(description ?? "")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            Spacer()

            Rectangle().frame(height: 40)
                .foregroundColor(.blue);
            
            HStack {
                Spacer()
                Button(action: {
                    print("Action")
                }) {
                    Text("Action")
                        .fontWeight(.bold)
                        .font(.system(size: 12))
                        .padding(.leading, 8)
                        .padding(.trailing, 8)
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }

                Button(action: {
                    print("Action")
                }) {
                    Text("Action")
                        .fontWeight(.bold)
                        .font(.system(size: 12))
                        .padding(.leading, 8)
                        .padding(.trailing, 8)
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Capsule())
                }
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}


#Preview {
    ExpandedCardView(title: "Expanded Card View Preview",
                     description: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cum ipsum dolorum alias? Aut molestias ex soluta, deleniti minus eius aliquam facere quis distinctio earum. Explicabo dignissimos sed dolor quasi inventore.", image: ["https://picsum.photos/400/200", "https://picsum.photos/400/200","https://picsum.photos/400/200","https://picsum.photos/400/200"])
}
