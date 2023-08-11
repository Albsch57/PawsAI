//
//  PageScenes.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 29.07.2023.
//

import UIKit

enum TabBarItem: String, CaseIterable {
    case trending, categories, saved, settings
}

extension TabBarItem {
    var image: UIImage? {
        UIImage(named: rawValue.capitalized)
    }
    
    var viewController: UIViewController {
        switch self {
        case .trending:
            return TrendingViewController()
        case .categories:
            return CategoriesViewController()
        case .saved:
            return FavoriteViewController()
        case .settings:
            return SettingsViewController()
        }
    }
}
