//
//  ContentView.swift
//  Texts
//
//  Created by Mehmet Tarhan on 09/11/2022.
//

import SwiftUI

// MARK: “How to create static labels with a Text view”

/**
 Text views show static text on the screen, and are equivalent to UILabel in UIKit. At their most basic they look like this:
 Text("Hello World")

 */

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Single line")
                .background(.green)

            Text("This is some multiline\ntexts\nit's")
                .lineLimit(3)
                .frame(width: 200)
                .padding()
                .background(.yellow)

            Text("This is some multiline texts truncationMode()")
                .lineLimit(1)
                .truncationMode(.middle)
                .padding()
                .background(.purple)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
