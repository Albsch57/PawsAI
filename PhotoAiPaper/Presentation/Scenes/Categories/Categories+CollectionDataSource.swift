//
//  Categories+CollectionDataSource.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 29.07.2023.
//

import UIKit

extension CategoriesViewController {
    final class DataSource: NSObject, UICollectionViewDataSource {
        
        private let items = Category.allCases
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            items.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let item = items[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseId, for: indexPath) as! CategoryCollectionViewCell
            cell.title = item.title
            cell.image = item.image
          
            return cell
        }
        
        func item(for indexPath: IndexPath) -> Category {
            items[indexPath.row]
        }
    }
}
