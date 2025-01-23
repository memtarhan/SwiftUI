//
//  ColorCircle.swift
//  TestApp
//
//  Created by Mehmet Tarhan on 23.01.2025.
//

import SwiftUI

struct ColorCircle: View {
    let rgb: RGB
    let size: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.element)
                .northWestShadow()
            Circle()
                .fill(Color(red: rgb.red, green: rgb.green, blue: rgb.blue))
                .padding(20)
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    ZStack {
        Color.element
        ColorCircle(rgb: RGB(), size: 200)
    }
    .frame(width: 300, height: 300)
}
