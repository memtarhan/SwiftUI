//
//  Tab.swift
//  ScrollableTabView
//
//  Created by Mehmet Tarhan on 26.03.2025.
//

import Foundation

public let tabs: [TabItem] = [
    TabItem(title: "Chats", systemImage: "phone"),
    TabItem(title: "Calls", systemImage: "bubble.left.and.bubble.right"),
    TabItem(title: "Settings", systemImage: "gearshape"),
]

public struct TabItem: Identifiable {
    public var title: String
    public var systemImage: String? = nil
    public var image: String? = nil

    public var id: String {
        title
    }
}

extension TabItem: Hashable { }

// enum Tab: String, CaseIterable {
//    case chats = "Chats"
//    case calls = "Calls"
//    case settings = "Settings"
//
//    var systemImage: String {
//        switch self {
//        case .chats:
//            return "phone"
//        case .calls:
//            return "bubble.left.and.bubble.right"
//        case .settings:
//            return "gearshape"
//        }
//    }
// }
