//
//  String+.swift
//  Movies
//
//  Created by Mehmet Tarhan on 10/11/2022.
//

import Foundation

extension String {
    var trimmedAndEscaped: String? {
        let trimmed = trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}
