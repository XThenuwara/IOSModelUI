//
//  AnimatedGradient.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-31.
//

import SwiftUI;

struct AnimatedGradient: View {
    @State private var appear = false
    @State private var appear2 = false
    
    var body: some View {
        MeshGradient(
            width: 3,
            height: 3,
            points: [
                [0.0, 0.0],
                [appear2 ? 0.5 : 1.0, 0.0],
                [1.0, 0.0],
                [0.0, 0.5],
                appear ? [0.1, 0.5] : [0.8, 0.2],
                [1.0, -0.5],
                [0.0, 1.0],
                [1.0, appear2 ? 2.0 : 1.01],
                [1.0, 1.0]
            ],
            colors: [
                appear2 ? .pink : .mint,
                appear2 ? .indigo : .cyan,
                .pink,
                appear ? .blue : .blue,
                appear ? .cyan : .teal,
                appear ? .blue : .purple,
                appear ? .emerald : .cyan,
                appear ? .mint : .blue,
                appear2 ? .pastelPurple : .blue
            ]
        )
        .onAppear {
            withAnimation(
                Animation.easeInOut(duration: 4)
                    .repeatForever(autoreverses: true)
            ) {
                appear.toggle()
            }
            withAnimation(
                Animation.easeInOut(duration: 4)
                    .repeatForever(autoreverses: true)
            ) {
                appear2.toggle()
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    AnimatedGradient()
}
