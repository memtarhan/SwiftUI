//
//  RatingView.swift
//  Movies
//
//  Created by Mehmet Tarhan on 09/11/2022.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int?

    var body: some View {
        HStack {
            ForEach(1 ... 10, id: \.self) { index in
                Image(systemName: self.starType(index: index))
                    .foregroundColor(.orange)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }

    private func starType(index: Int) -> String {
        if let rating = rating {
            return index <= rating ? "star.fill" : "star"
        }
        return "star"
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
