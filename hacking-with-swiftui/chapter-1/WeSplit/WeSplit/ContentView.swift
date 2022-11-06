//
//  ContentView.swift
//  WeSplit
//
//  Created by Mehmet Tarhan on 06/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    
    /**
     - Binding variables
     -> $variableName : read and write to the same value, two-way binding
     -> $variableName: The value of the property is read, and also written back when it's changed.
     */
    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            Text("Your name is \(name)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
