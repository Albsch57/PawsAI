//
//  ViewController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 29.07.2023.
//

import UIKit

final class CategoriesViewController: BaseViewController {
    
    private let dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
        navigationItem.title = "Categories"
     
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseId)
        collectionView.setCollectionViewLayout(CollectionLayout.columns(.one).layout, animated: false)
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        
    }
}

extension CategoriesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let listController = ListImagesViewController()
        listController.category = dataSource.item(for: indexPath)
        navigationController?.pushViewController(listController, animated: true)
    }
}
