//
//  LongPressGestureExample.swift
//  Gestures
//
//  Created by Mehmet Tarhan on 20.02.2025.
//

import SwiftUI

// MARK: - LongPressGesture

/*
 recognizes when the user presses and holds on a view for at least
 a period of time you specify. So, this creates an image view that halves in size when pressed
 for at least one second:

 */
struct LongPressGestureExample: View {
    @State private var scale = 1.0

    var body: some View {
        VStack {
            Text("Long Press Gesture Example")
                .font(.headline)
            Image(systemName: "globe.europe.africa")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue)
                .font(.system(size: 120))
                .scaleEffect(scale)
                .gesture(
                    LongPressGesture(minimumDuration: 1, maximumDistance: 3)
                        .onEnded({ _ in
                            scale /= 2
                        }))
        }
    }
}

#Preview {
    LongPressGestureExample()
}
