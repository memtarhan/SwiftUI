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
            List {
                ForEach(pictures, id: \.self) { picture in
                    AsyncImage(url: URL(string: picture)) { image in
                        image.resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.red
                    }

                    .frame(height: 128)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
