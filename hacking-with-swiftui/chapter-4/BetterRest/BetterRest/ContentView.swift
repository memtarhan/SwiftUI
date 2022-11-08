//
//  ContentView.swift
//  BetterRest
//
//  Created by Mehmet Tarhan on 08/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now

    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now..., displayedComponents: .hourAndMinute)
            .padding()
//            .labelsHidden()
    }

    var dateRange: ClosedRange<Date> {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now ... tomorrow
        return range
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
