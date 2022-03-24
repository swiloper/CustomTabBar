//
//  ViewController.swift
//  CustomTabBar
//
//  Created by myronishyn.ihor on 24.03.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let spacing: CGFloat = 10.0
        let defaultTabBarHeight: CGFloat = 49.0
        let desiredTabBarHeight: CGFloat = 65.0
        
        additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: spacing, right: 0)
        
        tabBar.frame.origin.x = spacing
        tabBar.frame.size.width -= spacing * 2
        tabBar.frame.origin.y -= desiredTabBarHeight - defaultTabBarHeight
        tabBar.frame.size.height = desiredTabBarHeight
        
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.layer.cornerRadius = 15.0
        
        if let items = tabBar.items {
            for item in items {
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -spacing)
            }
        }
    }
}

