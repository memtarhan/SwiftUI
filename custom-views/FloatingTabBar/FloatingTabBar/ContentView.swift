//
//  ContentView.swift
//  FloatingTabBar
//
//  Created by Mehmet Tarhan on 20.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var activeTab: TabModel = .home
    @State private var isTabBarHidden: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                if #available(iOS 18, *) {
                    TabView(selection: $activeTab) {
                        Tab(value: .home) {
                            NavigationStack {
                                HomeView()
//                                    .toolbarVisibility(.hidden, for: .tabBar)
                                    .toolbarBackgroundVisibility(
                                        .visible, for: .navigationBar, .tabBar)
                                    .toolbarBackground(.thinMaterial, for: .tabBar)
                            }
                        }

                        Tab(value: .search) {
                            Text("Search")
                                .toolbarVisibility(.hidden, for: .tabBar)
                        }

                        Tab(value: .notifications) {
                            Text("Notifications")
                                .toolbarVisibility(.hidden, for: .tabBar)
                        }

                        Tab(value: .settings) {
                            Text("Settings")
                                .toolbarVisibility(.hidden, for: .tabBar)
                        }
                    }

                } else {
                    TabView(selection: $activeTab) {
                        Text("Home")
                            .tag(TabModel.home)
                            .background {
                                if !isTabBarHidden {
                                    HideTabBar {
                                        print("Hidden")
                                        isTabBarHidden = true
                                    }
                                }
                            }

                        Text("Search")
                            .tag(TabModel.search)

                        Text("Notifications")
                            .tag(TabModel.notifications)

                        Text("Settings")
                            .tag(TabModel.settings)
                    }
                }
            }

            CustomTabBar(activeTab: $activeTab)
        }
    }
}

#Preview {
    ContentView()
}
