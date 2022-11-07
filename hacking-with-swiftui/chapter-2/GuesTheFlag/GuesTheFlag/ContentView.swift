//
//  ContentView.swift
//  GuesTheFlag
//
//  Created by Mehmet Tarhan on 06/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Spain", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()

    @State private var correctAnswer = Int.random(in: 0 ... 2)

    @State private var score = 0

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 32) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }

                VStack(spacing: 20) {
                    ForEach(0 ..< 3) { number in
                        Button {
                            // flag was tapped
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }

                VStack {
                    Text("Score")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.semibold))

                    Text("\(score)")
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.heavy))
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1

        } else {
            scoreTitle = "Wrong"
        }

//        showingScore = true
        askQuestion()
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
