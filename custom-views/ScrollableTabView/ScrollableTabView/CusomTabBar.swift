//
//  CusomTabBar.swift
//  ScrollableTabView
//
//  Created by Mehmet Tarhan on 26.03.2025.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tab?
    @Environment(\.colorScheme) private var scheme
    @Binding var tabProgress: CGFloat

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.self) { tab in
                HStack(spacing: 10) {
                    Image(systemName: tab.systemImage)
                    Text(tab.rawValue)
                        .font(.callout)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .contentShape(.capsule)
                .onTapGesture {
                    /// Updating Tab
                    withAnimation(.snappy) {
                        selectedTab = tab
                    }
                }
            }
        }
        .tabMask(tabProgress)
        /// Scrollable Active Tab Indicator
        .background(
            GeometryReader {
                let size = $0.size
                let capsuleWidth: CGFloat = size.width / CGFloat(Tab.allCases.count)

                Capsule()
                    .fill(scheme == .dark ? .black : .white)
                    .frame(width: capsuleWidth)
                    .offset(x: tabProgress * (size.width - capsuleWidth))
            }
        )
        .background(.gray.opacity(0.1), in: .capsule)
        .padding(.horizontal, 16)
    }
}
