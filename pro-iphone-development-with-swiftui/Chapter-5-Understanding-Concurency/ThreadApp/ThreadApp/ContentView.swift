//
//  ContentView.swift
//  ThreadApp
//
//  Created by Mehmet Tarhan on 6.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State var message = ""
    @State var slidervalue = 0.0

    enum Response {
        case success
    }

    var body: some View {
        VStack {
            Button("Click Me") {
                let startTime = Date()
                Thread.sleep(forTimeInterval: 2)
                callFunction()
                let endTime = Date()
                message = "Completed in \(endTime.timeIntervalSince(startTime)) seconds"
            }
            Spacer()
            Slider(value: $slidervalue)
            Text("Message = \(message)")
        }
        .padding()
    }

    func doSomething() async throws -> Response {
        .success
    }

    func callFunction() {
        Task(priority: .high) {
            do {
                _ = try await doSomething()

            } catch {
                //
            }
        }
    }
}

#Preview {
    ContentView()
}
