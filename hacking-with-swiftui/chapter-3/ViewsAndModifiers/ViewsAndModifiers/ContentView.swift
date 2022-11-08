//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Mehmet Tarhan on 08/11/2022.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content

    var body: some View {
        VStack(spacing: 5) {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack(spacing: 5) {
                    ForEach(0 ..< columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()

            GridStack(rows: 4, columns: 4) { row, column in
                Text("R\(row) C\(column)")
                    .padding()
                    .background(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }

            Spacer()

            GridStack(rows: 4, columns: 4) { row, column in
                Image(systemName: "\(row * 4 + column).circle")
            }

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
