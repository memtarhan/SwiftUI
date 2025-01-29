//
//  ContentView.swift
//  TestApp2
//
//  Created by Mehmet Tarhan on 27.01.2025.
//

import SwiftUI

// struct NeumorphicView: View {
//    var body: some View {
//        VStack {
//            Button("Hello, Neumorphism!", action: {
//            }).padding(20)
//                .background(
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color.neuBackground)
//                )
//                .shadow(color: .dropShadow, radius: 15, x: 10, y: 10)
//                .shadow(color: .dropLight, radius: 15, x: -10, y: -10)
//                .foregroundColor(.primary)
//        }
//    }
// }

//struct NeumorphicView: View {
//    var bgColor: Color
//
//    var body: some View {
//        VStack {
//            Button("Hello, Neumorphism!", action: {
//            }).padding(20)
//                .background(
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 10, style: .continuous)
//                            .shadow(color: .white, radius: 15, x: -10, y: -10)
//                            .shadow(color: .black, radius: 15, x: 10, y: 10)
//                            .blendMode(.overlay)
//                        RoundedRectangle(cornerRadius: 10, style: .continuous)
//                            .fill(bgColor)
//                    }
//                )
//                .foregroundColor(.primary)
//        }
//    }
//}

struct NeumorphicView: View {
    var bgColor: Color
    @State private var isPressed: Bool = false
    
    var body: some View {
        VStack {
            Button("Hello, Neumorphism!", action: {
                self.isPressed.toggle()
            }).padding(20)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .shadow(color: .white, radius: self.isPressed ? 7: 10, x: self.isPressed ? -5: -10, y: self.isPressed ? -5: -10)
                            .shadow(color: .black, radius: self.isPressed ? 7: 10, x: self.isPressed ? 5: 10, y: self.isPressed ? 5: 10)
                            .blendMode(.overlay)
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(bgColor)
                    }
            )
                .scaleEffect(self.isPressed ? 0.98: 1)
                .foregroundColor(.primary)
                .animation(.spring())
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            NeumorphicView(bgColor: Color.neuBackground)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.neuBackground)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
