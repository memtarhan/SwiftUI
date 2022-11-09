//
//  MoviesResponse.swift
//  Movies
//
//  Created by Mehmet Tarhan on 09/11/2022.
//

import Foundation

// MARK: - MoviesResponse

struct MoviesResponse: Codable {
    let movies: [MovieResponse]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case movies = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - MoviesSearchResponse

struct MovieResponse: Codable {
    let title, year, imdbID: String
    let type: TypeEnum
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case movie
    case series
}
