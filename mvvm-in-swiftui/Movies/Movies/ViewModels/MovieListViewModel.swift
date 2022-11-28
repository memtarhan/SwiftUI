//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Mehmet Tarhan on 10/11/2022.
//

import Foundation
import SwiftUI

class MovieListViewModel: ViewModelBase {
    @Published var movies = [MovieViewModel]()

    let httpClient = HTTPClient()

    func search(byName name: String) {
        guard !name.isEmpty,
              let query = name.trimmedAndEscaped else { return }

        loadingState = .loading

        httpClient.getMovies(bySearch: query) { result in
            switch result {
            case let .success(movies):
                DispatchQueue.main.async {
                    self.movies = movies.map(MovieViewModel.init)
                    self.loadingState = .success
                }
            case let .failure(error):
                print("failed to search \(error)")
                DispatchQueue.main.async {
                    self.movies = []
                    self.loadingState = .failure
                }
            }
        }
    }
}

struct MovieViewModel {
    let movie: MovieResponse

    var imdbId: String {
        movie.imdbID
    }

    var title: String {
        movie.title
    }

    var poster: String {
        movie.poster
    }

    var year: String {
        movie.year
    }
}
