//
//  View+.swift
//  ScrollableTabView
//
//  Created by Mehmet Tarhan on 26.03.2025.
//

import SwiftUI

/// Offset Key
struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func offsetX(completion: @escaping (CGFloat) -> Void) -> some View {
        overlay {
            GeometryReader { proxy in
                let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX

                Color.clear
                    .preference(key: OffsetKey.self, value: minX)
                    .onPreferenceChange(OffsetKey.self, perform: completion)
            }
        }
    }
    
    /// Tab bar Masking
    @ViewBuilder
    func tabMask(_ tabProgress: CGFloat, tabsCount: Int) -> some View {
        ZStack {
            self
                .foregroundStyle(.gray)
            self
                .symbolVariant(.fill)
                .mask {
                    GeometryReader {
                        let size = $0.size
                        let capsuleWidth: CGFloat = size.width / CGFloat(tabsCount)

                        Capsule()
                            .frame(width: capsuleWidth)
                            .offset(x: tabProgress * (size.width - capsuleWidth))
                    }
                }
            
        }
    }
}
