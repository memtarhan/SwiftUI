//
//  ContentView.swift
//  WeSplit
//
//  Created by Mehmet Tarhan on 06/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            /// A Form can get up to 10 elements but Group can be used
            VStack {
                Form {
                    Group {
                        Text("A1")
                        Text("A2")
                    }

                    Group {
                        Text("B1")
                        Text("B2")
                    }
                }
                Form {
                    Section {
                        Text("A1")
                        Text("A2")
                    }
                    Section {
                        Text("B1")
                        Text("B2")
                    }
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
