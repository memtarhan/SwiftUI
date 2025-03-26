//
//  Tab.swift
//  ScrollableTabView
//
//  Created by Mehmet Tarhan on 26.03.2025.
//

import Foundation

enum Tab: String, CaseIterable {
    case chats = "Chats"
    case calls = "Calls"
    case settings = "Settings"

    var systemImage: String {
        switch self {
        case .chats:
            return "phone"
        case .calls:
            return "bubble.left.and.bubble.right"
        case .settings:
            return "gearshape"
        }
    }
}
