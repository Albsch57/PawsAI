//
//  FavoriteViewController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 29.07.2023.
//

import UIKit

class FavoriteViewController: BaseViewController {
    
    private lazy var items = loadData()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Favorite"
        
        collectionView.register(BaseImageCollectionViewCell.self, forCellWithReuseIdentifier: BaseImageCollectionViewCell.reuseId)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.setCollectionViewLayout(CollectionLayout.columns(.two).layout, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        items = loadData()
        collectionView.reloadData()
    }
    
    private func loadData() -> [WallpaperUIItem] {
        UserDefaults.favoritesItems.compactMap {
            try? JSONDecoder().decode(WallpaperUIItem.self, from: $0)
        }
    }
}

extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseImageCollectionViewCell.reuseId, for: indexPath) as! BaseImageCollectionViewCell
        cell.backgroundColor = .systemGray6
        item.image(for: .full) { result in
            switch result {
            case .success(let image):
                cell.image = image?.preparingThumbnail(of: cell.bounds.size)
            case .failure(let error):
                print("Error loading image: \(error)")
            }
        }
        
        return cell
    }
}

extension FavoriteViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presentCard(for: item)
    }
}


