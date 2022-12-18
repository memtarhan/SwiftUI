//
//  AddBudgetCategoryView.swift
//  MyBudget
//
//  Created by Mehmet Tarhan on 17/12/2022.
//

import SwiftUI

struct AddBudgetCategoryView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var title: String = ""
    @State private var total: Double = 100
    @State private var messages: [String] = []

    private let minimumValue: NSNumber = 0
    private let maximumValue: NSNumber = 500

    var isFormValid: Bool {
        messages.removeAll()

        if title.isEmpty {
            messages.append("Title required")
        }

        if total <= 0 {
            messages.append("Total should be greater than 1")
        }

        return messages.isEmpty
    }

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                Slider(value: $total, in: 0 ... 500, step: 50) {
                    Text("Total")
                } minimumValueLabel: {
                    Text(minimumValue, formatter: NumberFormatter.currency)
                } maximumValueLabel: {
                    Text(maximumValue, formatter: NumberFormatter.currency)
                }

                Text(total as NSNumber, formatter: NumberFormatter.currency)

                ForEach(messages, id: \.self) { message in
                    Text(message)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if isFormValid {
                            save()
                        }
                    }
                }
            }
        }
    }

    private func save() {
        let budgetCategory = BudgetCategory(context: viewContext)
        budgetCategory.title = title
        budgetCategory.total = total

        do {
            try viewContext.save()

        } catch {
            print(error.localizedDescription)
        }
    }
}

struct AddBudgetCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetCategoryView()
    }
}
