//
//  Extension+UICollectionViewDelegate.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 25.08.2023.
//

import UIKit

extension UIViewController {
    func presentCard(for wallpaper: WallpaperUIItem) {
        let cardVC = CardViewController()
        cardVC.wallpaper = wallpaper
        navigationController?.present(cardVC, animated: true)
    }
}
