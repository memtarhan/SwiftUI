//
//  CoreDataManager.swift
//  MyBudget
//
//  Created by Mehmet Tarhan on 17/12/2022.
//

import CoreData
import Foundation

class CoreDataManager {
    static let shared = CoreDataManager()

    private var persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "BudgetModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Unable to initialize CoreData \(error)")
            }
            print("Initialized CoreData  \(description)")
        }
    }

    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
}
