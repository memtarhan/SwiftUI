//
//  TabModel.swift
//  ScrollableTabBar
//
//  Created by Mehmet Tarhan on 27.03.2025.
//

import Foundation

struct TabModel: Identifiable {
    private(set) var id: Tab
    var size: CGSize = .zero
    var minX: CGFloat = .zero

    enum Tab: String, CaseIterable {
        case research
        case deployment
        case analytics
        case audience
        case privacy
    }
}
