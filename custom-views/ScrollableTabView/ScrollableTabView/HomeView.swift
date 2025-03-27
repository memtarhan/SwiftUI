//
//  HomeView.swift
//  ScrollableTabView
//
//  Created by Mehmet Tarhan on 26.03.2025.
//

import SwiftUI

struct HomeView: View {
    var tabs: [TabItem]
    
    /// View properties
    @State private var selectedTab: TabItem?
    @Environment(\.colorScheme) private var scheme

    /// Tab Progress
    @State private var tabProgress: CGFloat = 0

    var body: some View {
        VStack(spacing: 16) {
            headerView

            /// Custom Tab Bar
            CustomTabBar(tabs: tabs, selectedTab: $selectedTab, tabProgress: $tabProgress)

            contentView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.gray.opacity(0.1))
    }

    private var headerView: some View {
        HStack {
            Button {
            } label: {
                Image(systemName: "line.3.horizontal.decrease")
            }

            Spacer()

            Button {
            } label: {
                Image(systemName: "bell.badge")
            }
        }
        .font(.title2)
        .overlay {
            Text("Messages")
                .font(.title3.bold())
        }
        .foregroundStyle(.primary)
        .padding(16)
    }

    private var contentView: some View {
        /// Paging View using new iOS17 APIs
        GeometryReader {
            let size = $0.size
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(tabs) { tab in
                        SampleView(color: [Color.red, .blue, .green, .yellow, .purple].randomElement()!)
                            .id(tab.id)
                            .containerRelativeFrame(.horizontal)
                    }
                    
                }
                .scrollTargetLayout()
                .offsetX { value in
                    /// Converting Offset into Progress
                    let progress = -value / (size.width * CGFloat(tabs.count - 1))
                    /// Capping Progress
                    tabProgress = max(min(progress, 1), 0)
                }
            }
            .scrollPosition(id: $selectedTab)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
            .scrollClipDisabled()
        }
    }
}

#Preview {
    ContentView()
}
