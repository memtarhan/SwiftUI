//
//  MyTabBar.swift
//  CustomTabBar
//
//  Created by Mehmet Tarhan on 29.01.2025.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable {
    case home = 0
    case favorite
    case chat
    case profile

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorite"
        case .chat:
            return "Chat"
        case .profile:
            return "Profile"
        }
    }

    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .favorite:
            return "star"
        case .chat:
            return "bubble"
        case .profile:
            return "person"
        }
    }

    var selectedIconName: String {
        switch self {
        case .home:
            return "house.fill"
        case .favorite:
            return "star.fill"
        case .chat:
            return "bubble.fill"
        case .profile:
            return "person.fill"
        }
    }
}

struct HomeView: View {
    var data = Array(0 ... 100)
    var body: some View {
        List {
            ForEach(data, id: \.self) { number in
                Text("Home #\(number)")
            }
        }
    }
}

struct FavoriteView: View {
    var body: some View {
        Text("Favorite View")
    }
}

struct ChatView: View {
    var body: some View {
        Text("Chat View")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
    }
}

struct MainTabbedView: View {
    @State var selectedTab = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                    .toolbarBackground(Color.systemBackground, for: .tabBar)
                FavoriteView()
                    .tag(1)
                    .toolbarBackground(Color.systemBackground, for: .tabBar)

                ChatView()
                    .tag(2)
                    .toolbarBackground(Color.systemBackground, for: .tabBar)

                ProfileView()
                    .tag(3)
                    .toolbarBackground(Color.systemBackground, for: .tabBar)
            }
            ZStack {
                GeometryReader { proxy in

                    HStack {
                        ForEach(TabbedItems.allCases, id: \.self) { item in
                            Button {
                                withAnimation(.easeInOut) {
                                    selectedTab = item.rawValue
                                }
                            } label: {
                                createTabItem(imageName: selectedTab == item.rawValue ? item.selectedIconName : item.iconName,
                                              title: item.title,
                                              isActive: selectedTab == item.rawValue,
                                              totalWidth: proxy.size.width)
                            }
                        }
                    }
                    .offset(y: 10)
                }
                .padding(.horizontal, 6)
            }
            .frame(height: 64, alignment: .bottom)
            .background(Color.accentColor.opacity(0.2))
            .clipShape(Capsule())
            .padding(.horizontal, 26)
            .offset(y: 18)
        }
    }
}

extension MainTabbedView {
    func createTabItem(imageName: String, title: String, isActive: Bool, totalWidth: CGFloat) -> some View {
        HStack(spacing: 10) {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? Color.primary : Color.secondary)
                .frame(width: 18, height: 18)
            if isActive {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(isActive ? Color.primary : Color.secondary)
            }
            Spacer()
        }
        .frame(width: isActive ? totalWidth / 2.5 : 44, height: 44)
        .background(isActive ? Color.accentColor.opacity(0.4) : .clear)
        .clipShape(Capsule())
    }
}

#Preview {
    MainTabbedView()
}
