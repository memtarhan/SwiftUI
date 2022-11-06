//
//  ContentView.swift
//  WeSplit
//
//  Created by Mehmet Tarhan on 06/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
