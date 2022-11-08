//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Mehmet Tarhan on 08/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()

            Text("Hello World!")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
                .padding()
                .background(.purple)

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
