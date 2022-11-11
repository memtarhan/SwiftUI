//
//  ContentView.swift
//  ImageLoader
//
//  Created by Mehmet Tarhan on 11/11/2022.
//

import SwiftUI

struct ContentView: View {
    let pictures = Bundle.main.decode([String].self, from: "pictures.json")

    var body: some View {
        NavigationView {
            List(pictures, id: \.self) { picture in
                AsyncImage(url: URL(string: picture)) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.red
                }
                .listRowBackground(Color.clear)
                .frame(height: 128)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            .listStyle(.insetGrouped)
            .listRowSeparator(.hidden)
            .navigationTitle("Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
