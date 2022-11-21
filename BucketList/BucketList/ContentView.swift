//
//  ContentView.swift
//  BucketList
//
//  Created by Mehmet Tarhan on 21/11/2022.
//

import SwiftUI

struct ContentView: View {
    let values = [1, 5, 3, 4, 8, 9, 6, 2].sorted()

    var body: some View {
        List(values, id: \.self) {
            Text("\($0)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
