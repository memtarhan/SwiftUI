//
//  ContentView.swift
//  WordScramble
//
//  Created by Mehmet Tarhan on 19/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }

    func process() {
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound
    }

    func processInput() {
        let input =
            """
            a
            b
            c
            """

        let lines = input.components(separatedBy: "\n")
        print(lines)
        let random = lines.randomElement()

        let trimmed = random?.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "sample", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                print(fileContents)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
