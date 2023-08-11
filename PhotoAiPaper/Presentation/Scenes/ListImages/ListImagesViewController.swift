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
    
    private let viewModel = ListViewModel()
    private lazy var dataSource = DataSource(collectionView: collectionView, items: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = category.title
        
        collectionView.register(BaseImageCollectionViewCell.self, forCellWithReuseIdentifier: BaseImageCollectionViewCell.reuseId)
        
        collectionView.dataSource = dataSource
        collectionView.setCollectionViewLayout(CollectionLayout.columns(.three).layout, animated: false)
        
        
        viewModel.fetchItems(for: category) { [weak self] items, error in
            if !items.isEmpty {
                self?.dataSource.items = items
                self?.collectionView.reloadData()
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
        
        item.imagePlaceholder { url, error in
            SDWebImageManager.shared.loadImage(with: url, progress: nil) { image, _, _, _, _, _ in
                cell.image = image?.sd_blurredImage(withRadius: 5)
                
                item.imagePreview { url, error in
                    SDWebImageManager.shared.loadImage(with: url, progress: nil) { image, _, _, _, _, _ in
                        cell.image = image?.sd_resizedImage(with: cell.bounds.size, scaleMode: .aspectFill)
                    }
                }
            }
        }
        
        
        return cell
    }
}
