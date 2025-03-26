//
//  HomeView.swift
//  ScrollableTabView
//
//  Created by Mehmet Tarhan on 26.03.2025.
//

import SwiftUI

struct HomeView: View {
    /// View properties
    @State private var selectedItem: String?
    @Environment(\.colorScheme) private var scheme
    
    @State private var tabs: [String] = ["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth"]
    @State private var contentData: [Color] = [.red, .blue, .green, .yellow, .orange, .purple, .pink, .gray, .black, .white]

    /// Tab Progress
    @State private var tabProgress: CGFloat = 0

    var body: some View {
        VStack(spacing: 16) {
            headerView

            /// Custom Tab Bar
            CustomTabBar(data: tabs, selectedItem: $selectedItem, tabProgress: $tabProgress)

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
                    ForEach(Array(contentData.enumerated()), id: \.element) { index, element in
                        SampleView(color: element)
                            .id(tabs[index])
                            .containerRelativeFrame(.horizontal)
                    }
                    
                }
                .scrollTargetLayout()
                .offsetX { value in
                    /// Converting Offset into Progress
                    let progress = -value / (size.width * CGFloat(contentData.count - 1))
                    /// Capping Progress
                    tabProgress = max(min(progress, 1), 0)
                }
            }
            .scrollPosition(id: $selectedItem)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
            .scrollClipDisabled()
        }
    }
}

#Preview {
    ContentView()
}
