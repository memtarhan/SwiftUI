//
//  URL+.swift
//  Movies
//
//  Created by Mehmet Tarhan on 09/11/2022.
//

import Foundation

extension URL {
    static func movies(bySearch search: String) -> URL? {
        URL(string: "\(Constants.apiBaseURL)?s=\(search)&apikey=\(Constants.apiKey)")
    }
}
