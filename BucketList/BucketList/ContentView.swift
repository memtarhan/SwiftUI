//
//  ContentView.swift
//  BucketList
//
//  Created by Mehmet Tarhan on 21/11/2022.
//

import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success.")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

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

    var loadingState = LoadingState.loading

    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()

        case .success:
            SuccessView()

        case .failed:
            FailedView()
        }
    }

    func writeAndRead() {
        let string = "Test Message"
        let url = getDocumentsDirectory().appendingPathComponent("message.txt")

        do {
            try string.write(to: url, atomically: true, encoding: .utf8)
            let input = try String(contentsOf: url)
            print(input)

        } catch {
            print(error.localizedDescription)
        }
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
