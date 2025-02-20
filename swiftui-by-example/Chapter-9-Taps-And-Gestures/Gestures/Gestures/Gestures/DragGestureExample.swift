//
//  DragGestureExample.swift
//  Gestures
//
//  Created by Mehmet Tarhan on 20.02.2025.
//

import SwiftUI

// MARK: - DragGesture

/*
 triggers when the user presses down on a view and moves at least a
 certain distance away. So, this creates an image with a drag gesture that triggers when the user
 moves it at least 50 points:
 */
/*
 Drag gestures are particularly good when combined with the offset() modifier, which lets us
 adjust the natural position of a view. For example, this offsets an image using a dragOffset
 size, which itself is attached to a drag gesture:
 */
struct DragGestureExample: View {
    @State private var dragCompleted = false
    @State private var dragOffset = CGSize.zero

    var body: some View {
        VStack {
            Text("Drag Gesture Example")
                .font(.headline)
            Image(systemName: "globe.europe.africa")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.red)
                .font(.system(size: 120))
                .offset(dragOffset)
                .gesture(
                    DragGesture(minimumDistance: 50)
                        .onChanged({ gesture in
                            dragOffset = gesture.translation
                        })
                        .onEnded({ _ in
                            dragCompleted = true
                            dragOffset = .zero
                        }))

            if dragCompleted {
                Text("Drag completed!")
            }
        }
    }
}

#Preview {
    DragGestureExample()
}
