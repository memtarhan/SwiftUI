//
//  ObservedObjectVie.swift
//  States
//
//  Created by Mehmet Tarhan on 21.02.2025.
//

import SwiftUI

// MARK: - How to use @ObservedObject to manage state from external objects

/*
 When using observed objects there are three key things we need to work with: the
 ObservableObject protocol is used with some sort of class that can store data, the
 @ObservedObject property wrapper is used inside a view to store an observable object
 instance, and the @Published property wrapper is added to any properties inside an observed
 object that should cause views to update when they change.
 */
/*
 Tip: It is really important that you use @ObservedObject only with views that were passed in
 from elsewhere. You should not use this property wrapper to create the initial instance of an
 observable object – that’s what @StateObject is for.
 */

class UserProgress: ObservableObject {
    @Published var score = 0
}

struct InnerView: View {
    @ObservedObject var progress: UserProgress
    var body: some View {
        Button("Increase Score") {
            progress.score += 1
        }
    }
}

struct ObservedObjectView: View {
    @StateObject var progress = UserProgress()

    var body: some View {
        VStack {
            Text("Your score is \(progress.score)")
            InnerView(progress: progress)
        }
    }
}

#Preview {
    ObservedObjectView()
}
