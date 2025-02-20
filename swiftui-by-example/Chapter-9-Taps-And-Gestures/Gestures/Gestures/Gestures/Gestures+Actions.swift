//
//  Gestures+Actions.swift
//  Gestures
//
//  Created by Mehmet Tarhan on 20.02.2025.
//

import SwiftUI

/// How to read tap and double-tap gestures
struct GesturesView1: View {
    var body: some View {
        VStack {
            Text("Tap me!")
                .font(.largeTitle)
                .onTapGesture {
                    print("Tapped!")
                }

            Image(systemName: "note.text")
                .font(.largeTitle)
                .onTapGesture(count: 2) {
                    print("Double tapped!")
                }
        }
    }
}

/// How to force one gesture to recognize before another using highPriorityGesture()
struct GesturesView2: View {
    var body: some View {
        VStack {
            Circle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    print("Circle tapped")
                }
        }
        .highPriorityGesture(
            TapGesture()
                .onEnded { _
                    in
                    print("VStack tapped")
                }
        )
    }
}

#Preview {
    GesturesView2()
}
