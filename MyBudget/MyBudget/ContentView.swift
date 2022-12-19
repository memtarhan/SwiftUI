//
//  ContentView.swift
//  MyBudget
//
//  Created by Mehmet Tarhan on 17/12/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var categories: FetchedResults<BudgetCategory>
    
    @State private var shouldPresent: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                List(categories) { category in
                    HStack {
                        Text(category.title ?? "")
                    }
                }
            }
            .sheet(isPresented: $shouldPresent, content: {
                AddBudgetCategoryView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Category") {
                        shouldPresent = true
                    }
                }
            }
            .padding()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
