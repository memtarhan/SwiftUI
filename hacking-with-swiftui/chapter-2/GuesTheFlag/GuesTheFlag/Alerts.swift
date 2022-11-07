//
//  Alerts.swift
//  GuesTheFlag
//
//  Created by Mehmet Tarhan on 07/11/2022.
//

import SwiftUI

struct Alerts: View {
    @State private var shouldShowAlert = false

    var body: some View {
        VStack {
            Button("Show Alert") {
                shouldShowAlert = true
            }
            .alert("Important message", isPresented: $shouldShowAlert) {
                Button("Delete", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Please read this")
            }
        }
    }
}

struct Alerts_Previews: PreviewProvider {
    static var previews: some View {
        Alerts()
    }
}
