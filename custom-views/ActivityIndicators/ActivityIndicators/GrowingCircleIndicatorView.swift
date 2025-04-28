//
//  GrowingCircleIndicatorView.swift
//  ActivityIndicators
//
//  Created by Mehmet Tarhan on 28.04.2025.
//

import SwiftUI

struct GrowingCircleIndicatorView: View {
    @State private var scale: CGFloat = 0
    @State private var opacity: Double = 0

    var body: some View {
        let animation = Animation
            .easeIn(duration: 1.1)
            .repeatForever(autoreverses: false)

        return Circle()
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
                scale = 0
                opacity = 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    withAnimation(animation) {
                        scale = 1
                        opacity = 0
                    }
                }
            }
    }
}

#Preview {
    VStack {
        GrowingCircleIndicatorView()
            .frame(width: 120, height: 120)
    }
}
