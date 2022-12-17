//
//  BudgetCategory+CoreDataClass.swift
//  MyBudget
//
//  Created by Mehmet Tarhan on 17/12/2022.
//

import CoreData
import Foundation

@objc(BudgetCategory)
public class BudgetCategory: NSManagedObject {
    override public func awakeFromInsert() {
        super.awakeFromInsert()

        dateCreated = Date()
    }
}
