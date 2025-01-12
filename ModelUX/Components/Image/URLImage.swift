//
//  Image.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2025-01-12.
//
import SwiftUI

public struct ImageConfig {
    var placeholder: SwiftUI.Image
    var contentMode: ContentMode
    var cornerRadius: CGFloat
    var width: CGFloat?
    var height: CGFloat?
    // TODO - make this more configurable
    var minSize: CGFloat?
    var maxSize: CGFloat?
    
    public init(
        placeholder: SwiftUI.Image = SwiftUI.Image(systemName: "photo"),
        contentMode: ContentMode = .fit,
        cornerRadius: CGFloat = 0,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        minSize: CGFloat? = nil,
        maxSize: CGFloat? = nil
    ) {
        self.placeholder = placeholder
        self.contentMode = contentMode
        self.cornerRadius = cornerRadius
        self.width = width
        self.height = height
        self.minSize = minSize
        self.maxSize = maxSize
    }
}

public struct URLImage: View {
    @State private var loadedImage: SwiftUI.Image? = nil
    @State private var isLoading: Bool = true
    let url: String
    let imageConfig: ImageConfig
    
    public init(url: String, imageConfig: ImageConfig = ImageConfig()) {
        self.url = url
        self.imageConfig = imageConfig
    }
    
    public var body: some View {
        Group {
            if let image = loadedImage {
                image
                    .resizable()
                    .aspectRatio(contentMode: imageConfig.contentMode)
                    .cornerRadius(imageConfig.cornerRadius)
                    .applyFrame(from: imageConfig)
            } else if isLoading {
                ProgressView()
                    .applyFrame(from: imageConfig)
            } else {
                imageConfig.placeholder
                    .resizable()
                    .aspectRatio(contentMode: imageConfig.contentMode)
                    .cornerRadius(imageConfig.cornerRadius)
                    .applyFrame(from: imageConfig)
            }
        }
        .task(id: url) {
            await loadImage()
        }
    }
    
    private func loadImage() async {
        guard let validURL = URL(string: url) else {
            isLoading = false
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: validURL)
            if let uiImage = UIImage(data: data) {
                loadedImage = SwiftUI.Image(uiImage: uiImage)
            }
        } catch {
            print("Error loading image: \(error)")
        }
        
        isLoading = false
    }
}

private extension View {
    func applyFrame(from config: ImageConfig) -> some View {
        self
            .frame(
                width: config.width,
                height: config.height
            )
            .frame(
                minWidth: config.minSize,
                maxWidth: config.maxSize,
                minHeight: config.minSize,
                maxHeight: config.maxSize
            )
    }
}


#Preview {
    URLImage(
        url: "https://avatars.githubusercontent.com/u/75056956?v=4",
        imageConfig: ImageConfig(
            placeholder: SwiftUI.Image(systemName: "photo"),
            contentMode: .fill,
            cornerRadius: 8
        )
    )
    .frame(width: 150, height: 150)
    .padding()
}
