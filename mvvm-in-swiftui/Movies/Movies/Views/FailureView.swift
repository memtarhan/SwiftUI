//
//  FailureView.swift
//  Movies
//
//  Created by Mehmet Tarhan on 10/11/2022.
//

import SwiftUI

struct FailureView: View {
    var body: some View {
        Text("Failed")
            .font(.largeTitle)
            .foregroundColor(.red)
    }
}

struct FailureView_Previews: PreviewProvider {
    static var previews: some View {
        FailureView()
    }
}
