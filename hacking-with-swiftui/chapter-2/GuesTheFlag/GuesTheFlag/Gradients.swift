//
//  Gradients.swift
//  GuesTheFlag
//
//  Created by Mehmet Tarhan on 07/11/2022.
//

import SwiftUI

struct Gradients: View {
    var body: some View {
        VStack {
            VStack {
                LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)

                LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: .purple, location: 0.3),
                                                          .init(color: .yellow, location: 0.6),
                                                          .init(color: .brown, location: 0.8)]), startPoint: .top, endPoint: .bottom)
            }

            VStack {
                RadialGradient(gradient: Gradient(colors: [.pink, .yellow]), center: .center, startRadius: 20, endRadius: 200)
            }
            
            VStack {
                AngularGradient(gradient: Gradient(colors: [.red, .green, .blue, .yellow, .purple, .green]), center: .center)
            }
        }
    }
}

struct Gradients_Previews: PreviewProvider {
    static var previews: some View {
        Gradients()
    }
}
