//
//  SettingsViewController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 29.07.2023.
//

import UIKit

final class SettingsViewController: BaseViewController {
    
    private let dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
        
        collectionView.setCollectionViewLayout(makeCompositionalLayout(), animated: false)
        collectionView.dataSource = dataSource
        collectionView.register(SettingsCollectionViewCell.self, forCellWithReuseIdentifier: SettingsCollectionViewCell.reuseId)
    }
}

extension SettingsViewController: SettingsCollectionViewCellDelegate {
    func settingsCellButtonTapped(_ cell: SettingsCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        let item = dataSource.items[indexPath.row]
        
        // В зависимости от нажатой кнопки
        switch item {
        case .tell:
            // Действия при нажатии кнопки "Tell a friend"
            break
        case .feedback:
            // Действия при нажатии кнопки "Feedback"
            break
        case .about:
            // Действия при нажатии кнопки "About us"
            break
        case .mode:
            // Действия при нажатии кнопки "Night Mode"
            break
        }
    }
}

extension SettingsViewController {
    private func makeCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(48))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}
