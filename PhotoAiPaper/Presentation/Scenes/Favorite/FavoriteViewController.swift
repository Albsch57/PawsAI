//
//  FavoriteViewController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 29.07.2023.
//

import UIKit

class FavoriteViewController: BaseViewController {
    
    private let dataSource = DataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Favorite"
        
        collectionView.register(BaseImageCollectionViewCell.self, forCellWithReuseIdentifier: BaseImageCollectionViewCell.reuseId)
        collectionView.dataSource = dataSource
        collectionView.setCollectionViewLayout(CollectionLayout.columns(.two).layout, animated: false)
        
    }

}
