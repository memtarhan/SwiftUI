//
//  ContentView.swift
//  GuesTheFlag
//
//  Created by Mehmet Tarhan on 06/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.green
                Color.blue
            }
            Text("ZStack")
                .font(.largeTitle)
                .foregroundStyle(.secondary)
                .padding(64)
                .background(.ultraThinMaterial)
        }

        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
