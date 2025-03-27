//
//  CusomTabBar.swift
//  ScrollableTabView
//
//  Created by Mehmet Tarhan on 26.03.2025.
//

import SwiftUI

/*
  ForEach(tabs) { tab in
      HStack(spacing: 10) {
          if let systemImage = tab.systemImage {
              Image(systemName: systemImage)
          } else if let image = tab.image {
              Image(image)
          }
          Text(tab.rawValue)
              .font(.callout)
      }
      .frame(maxWidth: .infinity)
      .padding(.vertical, 10)
      .contentShape(.capsule)
      .onTapGesture {
          /// Updating Tab
          withAnimation(.snappy) {
 //                        selectedTab = tab
          }
      }
  }

  */

struct CustomTabBar: View {
    var tabs: [TabItem]
    @Binding var selectedTab: TabItem?
    @Binding var tabProgress: CGFloat
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs) { tab in
                HStack(spacing: 16) {
                    if let systemImage = tab.systemImage {
                        Image(systemName: systemImage)
                    } else if let image = tab.image {
                        Image(image)
                    }
                    Text(tab.title)
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
        .tabMask(tabProgress, tabsCount: tabs.count)
        /// Scrollable Active Tab Indicator
        .background(
            GeometryReader {
                let size = $0.size
                let capsuleWidth: CGFloat = size.width / CGFloat(tabs.count)

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
