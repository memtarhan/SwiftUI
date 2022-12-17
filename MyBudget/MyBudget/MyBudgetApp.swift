//
//  MyBudgetApp.swift
//  MyBudget
//
//  Created by Mehmet Tarhan on 17/12/2022.
//

import SwiftUI

@main
struct MyBudgetApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}
