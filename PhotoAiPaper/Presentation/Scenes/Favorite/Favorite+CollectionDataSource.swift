//
//  Favorite+CollectionDataSource.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 30.07.2023.
//

import UIKit


extension FavoriteViewController {
    final class DataSource: NSObject, UICollectionViewDataSource {
        
        private let items = Category.allCases
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            items.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let item = items[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseImageCollectionViewCell.reuseId, for: indexPath) as! BaseImageCollectionViewCell
            cell.image = item.image
            
            return cell
        }
        
    }
}
