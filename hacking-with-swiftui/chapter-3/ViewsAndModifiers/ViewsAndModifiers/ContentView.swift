//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Mehmet Tarhan on 08/11/2022.
//

import SwiftUI

struct Watermark: ViewModifier {
    var text: String
    var alignment: Alignment

    func body(content: Content) -> some View {
        ZStack(alignment: alignment) {
            content

            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String, alignment: Alignment) -> some View {
        modifier(Watermark(text: text, alignment: alignment))
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Title")
                .modifier(Title())

            Text("Title 2")
                .titleStyle()

            Spacer()

            Color.blue
                .frame(width: 200, height: 200)
                .watermarked(with: "Watermark", alignment: .center)

            Spacer()
            
            Color.red
                .frame(width: 200, height: 200)
                .watermarked(with: "Watermark", alignment: .bottomTrailing)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
