//
//  Introduction+CollectionDataSource.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 02.08.2023.
//

import UIKit


extension IntroductionViewController {
    
    final class DataSource: NSObject, UICollectionViewDataSource {
        
        var items: [IntroductionItem] =
        [.embrace, .discover, .surround]
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            items.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let item = items[indexPath.row]
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IntroductionCollectionViewCell.reuseId, for: indexPath) as! IntroductionCollectionViewCell
            cell.configure(with: item)
            
            return cell
        }
 
    }
    
}
