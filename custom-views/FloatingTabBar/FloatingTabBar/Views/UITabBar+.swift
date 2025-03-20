//
//  UITabBar+.swift
//  FloatingTabBar
//
//  Created by Mehmet Tarhan on 20.03.2025.
//

import SwiftUI
import UIKit

struct HideTabBar: UIViewRepresentable {
    var result: () -> Void

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .red

        DispatchQueue.main.async {
            if let tabController = view.tabController {
                tabController.tabBar.isHidden = true
                result()
            }
        }

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

extension UIView {
    var tabController: UITabBarController? {
        if let controller = sequence(first: self, next: {
            $0.next
        }).first(where: { $0 is UITabBarController }) as? UITabBarController {
            return controller
        }
        return nil
    }
}
