//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Mehmet Tarhan on 08/11/2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        // Child version will override environment modifier
        VStack {
            Text("London")
            Text("Lisbon")
            Text("Paris")
            Text("Barcelona")
                .font(.largeTitle)
        }
        .font(.headline) // Environment modifier 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
