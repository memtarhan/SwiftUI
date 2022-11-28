//
//  URLImageView.swift
//  Movies
//
//  Created by Mehmet Tarhan on 09/11/2022.
//

import SwiftUI

struct URLImageView: View {
    let url: String
    let placeholder: String

    @ObservedObject var imageLoader = ImageLoader()

    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        imageLoader.downloadImage(url: url)
    }

    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()

        } else {
            return Image(placeholder).resizable()
        }
    }
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(url: "https://s.studiobinder.com/wp-content/uploads/2017/12/Movie-Poster-Template-Light-With-Image.jpg?x81279")
    }
}
