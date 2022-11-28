//
//  MovieListScreen.swift
//  Movies
//
//  Created by Mehmet Tarhan on 10/11/2022.
//

import SwiftUI

struct MovieListScreen: View {
    @ObservedObject private var viewModel = MovieListViewModel()

    @State private var searchQuery = "batman"

    var body: some View {
        NavigationView {
            if viewModel.loadingState == .success {
                VStack {
                    MovieListView(movies: viewModel.movies)
                }
                .navigationTitle("Movies")

            } else if viewModel.loadingState == .failure {
                FailureView()

            } else if viewModel.loadingState == .loading {
                LoadingView()
            }
        }
        .searchable(text: $searchQuery)
        .onSubmit(of: .search) {
            viewModel.search(byName: searchQuery)
        }
        .onChange(of: searchQuery) { _ in
            viewModel.search(byName: searchQuery)
        }

        .onAppear {
            viewModel.search(byName: searchQuery)
        }
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
