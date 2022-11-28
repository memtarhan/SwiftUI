//
//  Lists.swift
//  WordScramble
//
//  Created by Mehmet Tarhan on 19/11/2022.
//

import SwiftUI

struct FootballTeam: Identifiable {
    var id = UUID()

    var name: String
}

struct Lists: View {
    let cities = ["Lisbon", "London", "Paris", "Barcelona"]
    let teams = [FootballTeam(name: "49ers"), FootballTeam(name: "Bills"), FootballTeam(name: "Eagles"), FootballTeam(name: "Bengals")]

    var body: some View {
        List {
            Section {
                Text("A")
                Text("B")
                Text("C")
            }

            Section("Section 2") {
                ForEach(0 ..< 5) {
                    Text("Dynamic #\($0)")
                }
                Text("Static #1")
                Text("Static #2")
            }

            Section("Cities") {
                ForEach(cities, id: \.self) {
                    Text($0)
                }
            }

            Section("Football Teams") {
                ForEach(teams) {
                    Text($0.name)
                }
            }
        }
        .listStyle(.automatic)
    }
}

struct Lists_Previews: PreviewProvider {
    static var previews: some View {
        Lists()
    }
}
