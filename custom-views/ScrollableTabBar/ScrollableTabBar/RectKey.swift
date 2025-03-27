//
//  RectKey.swift
//  ScrollableTabBar
//
//  Created by Mehmet Tarhan on 27.03.2025.
//

import SwiftUI

struct RectKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func rect(completion: @escaping (CGRect) -> Void) -> some View {
        overlay {
            GeometryReader {
                let rect = $0.frame(in: .scrollView(axis: .horizontal))

                Color.clear
                    .preference(key: RectKey.self, value: rect)
                    .onPreferenceChange(RectKey.self, perform: completion)
            }
        }
    }
}
