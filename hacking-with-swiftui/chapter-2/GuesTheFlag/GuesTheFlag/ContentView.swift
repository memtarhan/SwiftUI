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
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)],
            center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()

            VStack {
                Spacer()

                Text("Guess The Flag!")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                VStack(spacing: 32) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    VStack(spacing: 16) {
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
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()

                VStack {
                    Text("Score")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.semibold))

                    Text("\(score)")
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.heavy))
                }
                
                Spacer()
            }
            .padding(20)
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
