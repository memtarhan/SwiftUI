//
//  MovieListScreen.swift
//  Movies
//
//  Created by Mehmet Tarhan on 10/11/2022.
//

import SwiftUI

struct MovieListScreen: View {
    @ObservedObject private var viewModel = MovieListViewModel()

    @State private var query = "batman"

    var body: some View {
        NavigationView {
            VStack {
                MovieListView(movies: viewModel.movies)
            }
            .navigationTitle("Movies")
        }
        .searchable(text: $query) {
        }
        .onAppear {
            viewModel.search(byName: query)
        }
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
