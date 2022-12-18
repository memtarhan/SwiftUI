//
//  NumberFormatter+.swift
//  MyBudget
//
//  Created by Mehmet Tarhan on 18/12/2022.
//

import Foundation

extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
