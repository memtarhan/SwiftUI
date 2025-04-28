//
//  TabModel.swift
//  ScrollableTabBar
//
//  Created by Mehmet Tarhan on 27.03.2025.
//

import Foundation

struct TabModel: Identifiable, Hashable, Equatable {
    private(set) var item: TabItem
    var size: CGSize = .zero
    var minX: CGFloat = .zero

    var id: String { item.id }

    func hash(into hasher: inout Hasher) {
        hasher.combine(item.id)
    }

    static func == (lhs: TabModel, rhs: TabModel) -> Bool {
        return lhs.item == rhs.item
    }
}

struct TabItem: Identifiable, Hashable, Equatable {
    let title: String

    var id: String { title }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: TabItem, rhs: TabItem) -> Bool {
        return lhs.id == rhs.id
    }
}
