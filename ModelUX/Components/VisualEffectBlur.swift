//
//  VisualEffectBlur.swift
//  ModelUX
//
//  Created by Yasas Hansaka Thenuwara on 2024-12-20.
//

import SwiftUI

struct VisualEffectBlur: UIViewRepresentable {
    var effect: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: effect))
        return blurView
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: effect)
    }
}
