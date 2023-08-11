//
//  CollectionLayout.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 29.07.2023.
//

import UIKit

enum Grid {
    case one, two, three
}

enum CollectionLayout {
    case columns(Grid)
    case introduction((Int) -> Void)
    
    var layout: UICollectionViewCompositionalLayout {
        if case .columns(.one) = self {
            return makeOneColumnLayout()
        }
        
        else if case .columns(.two) =  self {
            return makeTwoColumnLayout()
        }
        
        else if case .columns(.three) = self {
            return makeThreeColumnLayout()
        }
        
        else if case .introduction(let updater) = self {
           return makeIntroductionLayout(pageUpdater: updater)
        }
  
        
        fatalError("Такого макета не существует")
    }
}

extension CollectionLayout {
    private func makeOneColumnLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 18
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func makeTwoColumnLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(370))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(12)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 18
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func makeThreeColumnLayout() -> UICollectionViewCompositionalLayout  {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let heightGroup: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 350 : 194
        let columns = UIDevice.current.userInterfaceIdiom == .pad ? 4 : 3
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(heightGroup)), subitem: item, count: columns)
        group.interItemSpacing = .fixed(1)
        
        var section: NSCollectionLayoutSection
        section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
       // section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .vertical
        
        return .init(section: section, configuration: configuration)
    }
    
    private func makeIntroductionLayout(pageUpdater: @escaping (Int) -> Void) -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitem: item, count: 1)
        
        var section: NSCollectionLayoutSection
        section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        section.visibleItemsInvalidationHandler = { visibleItems, scrollOffset, layoutEnvironment in
            let pageIndex = Int(round(scrollOffset.x / UIScreen.main.bounds.width))
            pageUpdater(pageIndex)
        }
//        section.interGroupSpacing = 18
//        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        return .init(section: section)
    }
}
