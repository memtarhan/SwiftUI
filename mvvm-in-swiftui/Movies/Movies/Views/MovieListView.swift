//
//  MovieListView.swift
//  Movies
//
//  Created by Mehmet Tarhan on 10/11/2022.
//

import SwiftUI

struct MovieListView: View {
    let movies: [MovieViewModel]

    var body: some View {
        List(self.movies, id: \.imdbId) { movie in
            HStack(alignment: .center) {
                URLImageView(url: movie.poster)
                    .frame(width: 100, height: 120)
                    .cornerRadius(12)

                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)

                    Text(movie.year)
                        .opacity(0.5)
                }
                .padding()

                Spacer()
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movies: [MovieViewModel(movie: MovieResponse(title: "Sample", year: "2022", imdbID: "------x", type: .movie, poster: ""))])
    }
}
