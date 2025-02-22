//
//  StateAndObserverdView.swift
//  States
//
//  Created by Mehmet Tarhan on 21.02.2025.
//

import SwiftUI

// MARK: - How to use @StateObject to create and monitor external objects

/*
 SwiftUI’s @StateObject property wrapper is a specialized form of @ObservedObject,
 having all the same functionality with one important addition: it should be used to create
 observed objects, rather than just store one that was passed in externally.
 When you add a property to a view using @StateObject, SwiftUI considers that view to be the
 owner of the observable object. All other views where you pass that object should use
 @ObservedObject.
 This really matters. Seriously, if you get this wrong you might find your object gets
 destroyed by accident, which will cause your app to crash seemingly randomly.
 So, to be clear: you should create your observable object somewhere using @StateObject, and
 in all subsequent places where you pass that object you should use @ObservedObject.
 */

/*
 If you’re finding it hard to remember the distinction, try this: whenever you see “State” in a
 property wrapper, e.g. @State, @StateObject, @GestureState, it means “the current view
 owns this data.”
 */

// An example class to work with
class Player: ObservableObject {
    @Published var name = "Taylor"
    @Published var age = 26
}

// A view that creates and owns the Player object.
struct StateAndObserverdView: View {
    @StateObject var player = Player()

    var body: some View {
        NavigationStack {
            NavigationLink {
                PlayerNameView(player: player)
            } label: {
                Text("Show detail view")
            }
        }
    }
}

// A view that monitors the Player object for changes, but doesn't own it.
struct PlayerNameView: View {
    @ObservedObject var player: Player
    var body: some View {
        Text("Hello, \(player.name)!")
    }
}

#Preview {
    StateAndObserverdView()
}
