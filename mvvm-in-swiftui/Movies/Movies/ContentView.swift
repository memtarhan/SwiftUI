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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
