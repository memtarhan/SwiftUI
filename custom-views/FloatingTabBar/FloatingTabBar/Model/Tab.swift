//
//  Tab.swift
//  FloatingTabBar
//
//  Created by Mehmet Tarhan on 20.03.2025.
//

import SwiftUI

enum TabModel: String, CaseIterable {
    case home = "house"
    case search = "magnifyingglass"
    case notifications = "bell"
    case settings = "gearshape"
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .notifications:
            return "Notifications"
        case .settings:
            return "Settings"
        }
    }
}
