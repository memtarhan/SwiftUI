//
//  CusomTabBar.swift
//  ScrollableTabView
//
//  Created by Mehmet Tarhan on 26.03.2025.
//

import SwiftUI

struct CustomTabBar: View {
    var data: [String]
    @Binding var selectedItem: String?
    @Environment(\.colorScheme) private var scheme
    @Binding var tabProgress: CGFloat

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(data, id: \.self) { item in
                    HStack(spacing: 10) {
                        Text(item)
                            .font(.callout)
                    }
                    .frame(width: 160)
                    .padding(.vertical, 10)
                    .contentShape(.capsule)
                    .onTapGesture {
                        /// Updating Tab
                        withAnimation(.snappy) {
                            selectedItem = item
                        }
                    }
                    .id(item)
                }
            }

            .tabMask(tabProgress, count: data.count)
            /// Scrollable Active Tab Indicator
            .background(
                GeometryReader {
                    let size = $0.size
                    let capsuleWidth: CGFloat = size.width / CGFloat(data.count)

                    Capsule()
                        .fill(scheme == .dark ? .black : .white)
                        .frame(width: capsuleWidth)
                        .offset(x: tabProgress * (size.width - capsuleWidth))
                }
            )
            .background(.gray.opacity(0.1), in: .capsule)
            .padding(.horizontal, 16)
//            .scrollTargetLayout()
        }
        .scrollPosition(id: $selectedItem)
        .scrollTargetBehavior(.paging)
    }
}

#Preview {
    ContentView()
}
