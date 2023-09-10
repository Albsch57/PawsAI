//
//  Extension+UICollectionView.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 28.08.2023.
//

import UIKit

extension UICollectionView {
    static func makeBaseCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.alwaysBounceVertical = false
        collectionView.backgroundColor = .clear
        return collectionView
    }
}
