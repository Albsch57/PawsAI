//
//  ListImagesViewController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 02.08.2023.
//

import UIKit
import SDWebImage

final class ListImagesViewController: BaseViewController {
    
    var category: Category! = nil
    
    private let viewModel = ListImagesViewModel()
    private lazy var dataSource = DataSource(collectionView: collectionView, items: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = category.title
        
        collectionView.register(BaseImageCollectionViewCell.self, forCellWithReuseIdentifier: BaseImageCollectionViewCell.reuseId)
        
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.setCollectionViewLayout(CollectionLayout.columns(.three).layout, animated: false)
        
        viewModel.wallpapers(for: category) { wallpapaerItems, error in
            
        
            if let wallpapaerItems {
                self.dataSource.items = wallpapaerItems
                self.collectionView.reloadData()
            }
        }
    }

}

fileprivate final class DataSource: NSObject, UICollectionViewDataSource {

    let collectionView: UICollectionView
    var items: [WallpaperUIItem]
    
    init(collectionView: UICollectionView, items: [WallpaperUIItem]) {
        self.collectionView = collectionView
        self.items = items
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseImageCollectionViewCell.reuseId, for: indexPath) as! BaseImageCollectionViewCell
        let item = items[indexPath.row]
        
        cell.backgroundColor = .systemGray6
        
        item.image(for: .mini) { result in
            if case .success(let image) = result {
                cell.image = image?.preparingThumbnail(of: cell.bounds.size)
            }
        }
        
        return cell
    }
}

extension ListImagesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = dataSource.items[indexPath.row]
        presentCard(for: item)
    }
}
