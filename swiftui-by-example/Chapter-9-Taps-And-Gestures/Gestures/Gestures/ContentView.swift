//
//  ContentView.swift
//  Gestures
//
//  Created by Mehmet Tarhan on 20.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                TapGestureExample()
                LongPressGestureExample()
                DragGestureExample()
            }
            .padding()
            .navigationTitle("Gestures")
        }
    }
}

#Preview {
    ContentView()
}
