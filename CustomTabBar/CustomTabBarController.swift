//
//  ViewController.swift
//  CustomTabBar
//
//  Created by myronishyn.ihor on 24.03.2022.
//

import UIKit

final class CustomTabBarController: UITabBarController {
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutTrait(traitCollection: UIScreen.main.traitCollection)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        layoutTrait(traitCollection: traitCollection)
    }
    
    /// This function changes the appearance of the tabBar depending on the screen orientation
    private func layoutTrait(traitCollection: UITraitCollection) {
        let spacing: CGFloat = 10.0
        let portraitTabBarHeight: CGFloat = 49.0
        let landscapeTabBarHeight: CGFloat = 32.0
        let desiredTabBarHeight: CGFloat = 65.0
        
        additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: spacing, right: 0)
        
        // Moves tabBar to the right by spacing
        tabBar.frame.origin.x = spacing
        // Reduces the size of tabBar, taking into account the indentation on the right and left
        tabBar.frame.size.width -= spacing * 2
        // Changes the y-coordinate position of the tabBar by the difference between the standard tabBar height and the custom one
        tabBar.frame.size.height = desiredTabBarHeight
        
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.layer.cornerRadius = 15.0
        tabBar.layer.masksToBounds = true
        
        if let items = tabBar.items {
            for item in items {
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -spacing)
            }
        }
        
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            tabBar.frame.origin.y -= desiredTabBarHeight - portraitTabBarHeight
        } else {
            tabBar.frame.origin.y -= desiredTabBarHeight - landscapeTabBarHeight
        }
    }
}

extension UITabBar {
    override open var traitCollection: UITraitCollection {
        if UIDevice.current.orientation.isLandscape {
            return UITraitCollection(horizontalSizeClass: .compact)
        }
        return super.traitCollection
    }
}
