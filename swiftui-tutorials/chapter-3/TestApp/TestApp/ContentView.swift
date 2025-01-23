//
//  ContentView.swift
//  TestApp
//
//  Created by Mehmet Tarhan on 22.01.2025.
//

import SwiftUI

extension View {
    func northWestShadow(radius: CGFloat = 16, offset: CGFloat = 6) -> some View {
        return shadow(color: .highlight, radius: radius, x: -offset, y: -offset)
            .shadow(color: .shadow, radius: radius, x: offset, y: offset)
    }

    func southEastShadow(radius: CGFloat = 16, offset: CGFloat = 6) -> some View {
        return shadow(color: .shadow, radius: radius, x: -offset, y: -offset)
            .shadow(color: .highlight, radius: radius, x: offset, y: offset)
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var trackColor: Color
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .accentColor(trackColor)
            Text("255")
        }
        .padding(.horizontal)
    }
}

struct ContentView: View {
    @State var game = Game()
    @State var guess: RGB
    @State var showScore = false

    var body: some View {
        ZStack {
            Color.element
                .edgesIgnoringSafeArea(.all)
            VStack {
                ColorCircle(rgb: game.target, size: 200)
                if !showScore {
                    Text("R: ??? G: ??? B: ???")
                        .padding()
                } else {
                    Text(game.target.intString)
                        .padding()
                }
                ColorCircle(rgb: guess, size: 200)
                Text(guess.intString)
                    .padding()

                ColorSlider(value: $guess.red, trackColor: .red)
                ColorSlider(value: $guess.green, trackColor: .green)
                ColorSlider(value: $guess.blue, trackColor: .blue)
                Button("Hit Me!") {
                    self.showScore = true
                    self.game.check(guess: guess)
                }
                .alert(isPresented: $showScore) {
                    Alert(
                        title: Text("Your Score"),
                        message: Text(String(game.scoreRound)),
                        dismissButton: .default(Text("OK")) {
                            self.game.startNewRound()
                            self.guess = RGB()
                        })
                }
            }
        }
    }
}

#Preview {
    ContentView(guess: RGB())
}
