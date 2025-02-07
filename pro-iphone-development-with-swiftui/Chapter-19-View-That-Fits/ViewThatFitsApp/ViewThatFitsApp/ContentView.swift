//
//  ContentView.swift
//  ViewThatFitsApp
//
//  Created by Mehmet Tarhan on 7.02.2025.
//

import SwiftUI

struct VerticalView: View {
    var body: some View {
        VStack(spacing: 25) {
            Rectangle()
                .frame(width: 250, height: 200)
                .foregroundStyle(.red)

            Circle()
                .frame(width: 250, height: 250)
                .foregroundStyle(.green)

            Capsule()
                .frame(width: 250, height: 200)
                .foregroundStyle(.blue)

            Text("Vertical View")
                .font(.largeTitle)
        }
        .padding()
    }
}

struct HorizontalView: View {
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Rectangle()
                    .frame(width: 250, height: 200)
                    .foregroundStyle(.red)

                Circle()
                    .frame(width: 250, height: 250)
                    .foregroundStyle(.green)

                Capsule()
                    .frame(width: 250, height: 200)
                    .foregroundStyle(.blue)
            }
            .padding()

            Text("Horizontal View")
                .font(.largeTitle)
        }
    }
}

struct OptionsView: View {
    var body: some View {
        Button("Log in") { }
            .buttonStyle(.borderedProminent)

        Button("Create Account") { }
            .buttonStyle(.bordered)

        Button("Settings") { }
            .buttonStyle(.bordered)

        Spacer().frame(width: 50, height: 50)

        Button("Need Help?") { }
    }
}

struct ContentView: View {
    var body: some View {
        ViewThatFits {
            HStack(content: OptionsView.init)
            VStack(content: OptionsView.init)
        }
    }
}

#Preview {
    ContentView()
}
