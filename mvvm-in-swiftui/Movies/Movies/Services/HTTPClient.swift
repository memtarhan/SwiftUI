//
//  HTTPClient.swift
//  Movies
//
//  Created by Mehmet Tarhan on 09/11/2022.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class HTTPClient {
    func getMovies(bySearch search: String, completion: @escaping (Result<[MovieResponse], NetworkError>) -> Void) {
        guard let url = URL.movies(bySearch: search) else {
            return completion(.failure(.badURL))
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data,
                  error == nil else {
                return completion(.failure(.noData))
            }

            guard let response = try? JSONDecoder().decode(MoviesResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }

            completion(.success(response.movies))
        }.resume()
    }
}
