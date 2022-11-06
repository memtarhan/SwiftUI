//
//  ContentView.swift
//  GuesTheFlag
//
//  Created by Mehmet Tarhan on 06/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image(systemName: "number")
            VStack {
                HStack {
                    Text("1")
                    Text("2")
                    Text("3")
                }
                HStack {
                    Text("4")
                    Text("5")
                    Text("6")
                }
                HStack {
                    Text("7")
                    Text("8")
                    Text("9")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
