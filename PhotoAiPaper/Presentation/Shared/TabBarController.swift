//
//  TabBarController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 29.07.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    var circleIcon: UIImageView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        tabBar.tintColor = .accentBlue
        tabBar.unselectedItemTintColor = .systemGray6
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.addTabBarIndicatorView(index: 0, isFirstTime: true)
        })
        
    }
    
    private func addTabBarIndicatorView(index: Int, isFirstTime: Bool = false) {
        guard let tabView = tabBar.items?[index].value(forKey: "view") as? UIView else {
            return
        }
        
        if !isFirstTime {
            circleIcon.removeFromSuperview()
        }
        
        circleIcon = UIImageView(image: .init(systemName: "circle.fill"))
        circleIcon.frame = .init(x: tabView.frame.midX - 2, y: tabView.frame.maxY - 8, width: 4, height: 4)
        circleIcon.tintColor = .accentBlue
        tabBar.addSubview(circleIcon)
    }
    
}

extension TabBarController {
    func configureItems(_ items: [TabBarItem]) {
        viewControllers = items.map({
            let navigationController = UINavigationController(rootViewController: $0.viewController)
            navigationController.tabBarItem.image = $0.image
            return navigationController
        })
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        addTabBarIndicatorView(index: selectedIndex)
    }
}
