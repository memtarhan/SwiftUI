//
//  iDineApp.swift
//  iDine
//
//  Created by Mehmet Tarhan on 19.02.2025.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
