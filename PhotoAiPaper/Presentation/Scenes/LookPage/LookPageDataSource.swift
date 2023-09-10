//
//  LookPageDataSource.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 28.08.2023.
//

import UIKit

extension LookPageViewController {
    
    final class DataSource: NSObject, UICollectionViewDataSource {
        var items: [LookPageItem] =
        [.date, .time, .icons]
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            items.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let item = items[indexPath.row]
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LookPageCollectionViewCell.reuseId, for: indexPath) as! LookPageCollectionViewCell
            cell.configure(with: item)
            
            return cell
        }
    }
        
}
