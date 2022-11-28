//
//  ContentView.swift
//  Movies
//
//  Created by Mehmet Tarhan on 09/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            URLImageView(url: "https://s.studiobinder.com/wp-content/uploads/2017/12/Movie-Poster-Template-Light-With-Image.jpg")
        }
        .padding()
        .onAppear {
            HTTPClient().getMovies(bySearch: "batman") { result in
                switch result {
                case let .success(movies):
                    print("fetched movies: \(movies.count)")
                case let .failure(error):
                    print("failed to fetch movies: \(error)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
