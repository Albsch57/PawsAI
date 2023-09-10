//
//  Settings+DataSource.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 30.07.2023.
//

import UIKit

extension SettingsViewController {
    final class DataSource: NSObject, UICollectionViewDataSource {
        
        var items: [SettingsItem] =
            [.tell, .feedback, .about, .mode]
        
        weak var pc: SettingsViewController?
        
        init(parentController: SettingsViewController) {
            pc = parentController
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            items.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let item = items[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsCollectionViewCell.reuseId, for: indexPath) as! SettingsCollectionViewCell
            cell.delegate = pc
        
            cell.configure(with: item)
            
            return cell
        }
 
    }
}
