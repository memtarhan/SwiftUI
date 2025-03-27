//
//  ContentView.swift
//  ScrollableTabBar
//
//  Created by Mehmet Tarhan on 27.03.2025.
//

import SwiftUI

struct HomeView: View {
    /// View properties
    @State private var tabs: [TabModel] = [
        TabModel(id: .research),
        TabModel(id: .deployment),
        TabModel(id: .analytics),
        TabModel(id: .audience),
        TabModel(id: .privacy),
    ]

    @State private var activeTab: TabModel.Tab = .research
    @State private var mainViewScrollState: TabModel.Tab?
    @State private var tabBarScrollState: TabModel.Tab?
    @State private var progress: CGFloat = .zero
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()

            CustomTabBar()

            GeometryReader {
                let size = $0.size

                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        /// Individual view for each tab
                        ForEach(tabs) { tab in
                            Text(tab.id.rawValue.capitalized)
                                .frame(width: size.width, height: size.height)
                                .contentShape(.rect)
                        }
                    }
                    .scrollTargetLayout()
                    .rect { rect in
                        progress = -rect.minX / size.width
                    }
                }
                .scrollPosition(id: $mainViewScrollState)
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.paging)
                .onChange(of: mainViewScrollState) { _, newValue in
                    if let newValue {
                        withAnimation(.snappy) {
                            tabBarScrollState = newValue
                            activeTab = newValue
                        }
                    }
                }
            }
        }
    }

    // MARK: - Header View

    @ViewBuilder
    func HeaderView() -> some View {
        HStack {
            HStack {
                Image(systemName: "house")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45)
                Text("Home")
                    .font(.title2.bold())
            }

            Spacer(minLength: 0)

            Button("", systemImage: "plus.circle") {
            }
            .font(.title2)
            .tint(.primary)

            Button("", systemImage: "bell") {
            }
            .font(.title2)
            .tint(.primary)
        }
        .padding(15)
        /// Divider
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(.gray.opacity(0.3))
                .frame(height: 1)
        }
    }

    // MARK: - Dynamic Scrollable Tab Bar

    @ViewBuilder
    func CustomTabBar() -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach($tabs) { $tab in
                    Button(action: {
                        withAnimation(.snappy) {
                            activeTab = tab.id
                            mainViewScrollState = tab.id
                            tabBarScrollState = tab.id
                        }
                    }) {
                        Text(tab.id.rawValue.capitalized)
                            .padding(.vertical, 12)
                            .foregroundStyle(activeTab == tab.id ? Color.primary : .gray)
                            .contentShape(.rect)
                    }
                    .buttonStyle(.plain)
                    .rect { rect in
                        tab.size = rect.size
                        tab.minX = rect.minX
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: .init(get: {
            tabBarScrollState
        }, set: { _ in

        }), anchor: .center)
        .overlay(alignment: .bottom, content: {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(height: 1)
                
                let inputRange = tabs.indices.compactMap { CGFloat($0) }
                let outputRange = tabs.compactMap { $0.size.width }
                let indicatorWidth = progress.interpolate(inputRange: inputRange, outputRange: outputRange)
                let outputPositionRange = tabs.compactMap { $0.minX }
                let indicatorPosition = progress.interpolate(inputRange: inputRange, outputRange: outputPositionRange)
                
                Rectangle()
                    .fill(.primary)
                    .frame(width: indicatorWidth,height: 1.5)
                    .offset(x: indicatorPosition)
            }
        })
        .safeAreaPadding(.horizontal, 15)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    HomeView()
}
