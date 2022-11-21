//
//  ContentView.swift
//  BucketList
//
//  Created by Mehmet Tarhan on 21/11/2022.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String

    static func < (lhs: User, rhs: User) -> Bool {
        lhs.firstName < rhs.firstName
    }
}

struct ContentView: View {
    let users = [
        User(firstName: "Mehmet", lastName: "Tarhan"),
        User(firstName: "Adem", lastName: "Tarhan"),
        User(firstName: "Ali", lastName: "Tarhan"),
    ].sorted()

    let values = [1, 5, 3, 4, 8, 9, 6, 2].sorted()

    var body: some View {
        VStack(spacing: 0) {
            List(values, id: \.self) {
                Text("\($0)")
            }
            List(users) { user in
                Text("\(user.firstName) \(user.lastName)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
