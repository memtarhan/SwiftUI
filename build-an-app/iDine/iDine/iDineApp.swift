//
//  iDineApp.swift
//  iDine
//
//  Created by Mehmet Tarhan on 08/11/2022.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
