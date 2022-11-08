//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Mehmet Tarhan on 08/11/2022.
//

import SwiftUI

struct ContentView: View {
    var motto1: some View {
        Text("Draco")
    }

    let motto2 = Text("Nunquam")

    var spells: some View {
        Group {
            Text("Lumos")
            Text("Tuto")
        }
    }

    @ViewBuilder var spells2: some View {
        Text("Lumos")
        Text("Tuto")
    }
    
    var body: some View {
        VStack {
            VStack {
                motto1
                    .foregroundColor(.red)
                motto2
                    .foregroundColor(.blue)
            }

            Divider()

            VStack {
                spells
            }

            Divider()

            HStack {
                spells
            }

            Divider()
            
            spells
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
