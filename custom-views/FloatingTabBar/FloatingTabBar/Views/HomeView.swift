//
//  HomeView.swift
//  FloatingTabBar
//
//  Created by Mehmet Tarhan on 20.03.2025.
//

import SwiftUI

struct HomeView: View {
    private let array = Array(0 ... 1000)

    var body: some View {
        List {
            ForEach(array, id: \.self) { index in
                Text("Item \(index)")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .font(.title2.monospaced())
                    .background(.yellow)
            }
        }
        .background(.yellow)
        .navigationTitle("Home")
    }
}

#Preview {
    HomeView()
}
