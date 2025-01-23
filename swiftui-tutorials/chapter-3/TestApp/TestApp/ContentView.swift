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
        .font(.subheadline)
    }
}

struct ContentView: View {
    @State var game = Game()
    @State var guess: RGB
    @State var showScore = false

    let circleSize: CGFloat = 0.275
    let labelHeight: CGFloat = 0.06
    let labelWidth: CGFloat = 0.53
    let buttonWidth: CGFloat = 0.87

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.element
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ColorCircle(rgb: game.target, size: proxy.size.height * circleSize)
                    if !showScore {
                        BevelText(text: "R: ??? G: ??? B: ???", width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)

                    } else {
                        BevelText(text: game.target.intString, width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    }
                    ColorCircle(rgb: guess, size: proxy.size.height * circleSize)
                    BevelText(text: guess.intString, width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)

                    ColorSlider(value: $guess.red, trackColor: .red)
                    ColorSlider(value: $guess.green, trackColor: .green)
                    ColorSlider(value: $guess.blue, trackColor: .blue)
                    Button("Hit Me!") {
                        self.showScore = true
                        self.game.check(guess: guess)
                    }
                    .buttonStyle(NeuButtonStyle(width: proxy.size.width * buttonWidth, height: proxy.size.height * labelHeight))

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
                .font(.headline)
            }
        }
    }
}

#Preview {
    ContentView(guess: RGB())
}
