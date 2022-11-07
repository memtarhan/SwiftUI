//
//  Buttons.swift
//  GuesTheFlag
//
//  Created by Mehmet Tarhan on 07/11/2022.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        VStack {
            Spacer()

            Button("Delete selection") {
            }

            Button("Delete", role: .destructive, action: executeDelete)

            Spacer()

            VStack(spacing: 20) {
                Button("Button 1") {}
                    .buttonStyle(.bordered)

                Button("Button 2", role: .destructive) {}
                    .buttonStyle(.bordered)

                Button("Button 3") {}
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)

                Button("Button 4", role: .destructive) {}
                    .buttonStyle(.borderedProminent)
            }

            Spacer()

            VStack(spacing: 20) {
                Button {
                    print("didTapButton")
                } label: {
                    Text("Tap Me!")
                        .padding()
                        .foregroundColor(.white)
                        .background(.red)
                }

                Button {
                    print("didTapEditButton")
                } label: {
                    Image(systemName: "pencil")
                }

                Button {
                    print("didTapEditButton")
                } label: {
                    Label("Edit", systemImage: "pencil")
                }
            }

            Spacer()
        }
    }

    func executeDelete() {
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
