//
//  TapGestureExample.swift
//  Gestures
//
//  Created by Mehmet Tarhan on 20.02.2025.
//

import SwiftUI

// MARK: - TapGesture

/*
 When you create this you can specify how many taps it takes to trigger the
 gesture, then attach an onEnded closure that will be run when the gesture happens. For
 example, this creates an image that gets smaller every time it’s tapped:
 */
struct TapGestureExample: View {
    @State private var scale = 1.0

    var body: some View {
        VStack {
            Text("Tap Gesture Example")
                .font(.headline)
            Image(systemName: "globe.europe.africa")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.green)
                .font(.system(size: 120))
                .scaleEffect(scale)
                .gesture(
                    TapGesture()
                        .onEnded({ _ in
                            scale -= 0.05
                        }))
        }
    }
}

#Preview {
    TapGestureExample()
}
