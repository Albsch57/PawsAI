//
//  TrendingViewController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 29.07.2023.
//

import UIKit

class TrendingViewController: BaseViewController {
    
    private lazy var items = [WallpaperUIItem]()
    
    private let viewModel = TrendingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Trending"
        
        collectionView.register(BaseImageCollectionViewCell.self, forCellWithReuseIdentifier: BaseImageCollectionViewCell.reuseId)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.setCollectionViewLayout( CollectionLayout.columns(.two).layout, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showIntroduction()
        loadData()
    }
    
    private func loadData() {
        //        UserDefaults.trendingItems.compactMap {
        //            try? JSONDecoder().decode(WallpaperUIItem.self, from: $0)
        //        }
        
        viewModel.fetchTrendingDocuments { [weak self] items, error in
            if let error = error {
                print("Error fetching trending documents: \(error.localizedDescription)")
            } else {
                
                
                DispatchQueue.main.async {
                    
                        self?.items = (items ?? []).reversed()
                        self?.collectionView.reloadData()
                    }
                }
            }
        }
        
        
        //        let repository = FirebaseDatabaseImpl()
        //
        //        repository.fetchTrendingDocuments { results, error in
        //            let wallpapers = results?.compactMap { document in
        //                var wallpaper = try? document.data(as: WallpaperUIItem.self)
        //                wallpaper?.documentID = document.documentID
        //                // wallpaper?.category = self.wallpaper?.category
        //                return wallpaper
        //            }
        //
        //
        //            DispatchQueue.main.async {
        //                self.items = (wallpapers ?? []).reversed()
        //                self.collectionView.reloadData()
        //            }
        //
        //        }
    }
    


extension TrendingViewController {
    private func showIntroduction() {
        guard !UserDefaults.introductionIsPresented else { return }
        let introduction = IntroductionViewController()
        navigationController?.present(introduction, animated: false, completion: {
            UserDefaults.introductionIsPresented = true
        })
    }
}

extension TrendingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseImageCollectionViewCell.reuseId, for: indexPath) as! BaseImageCollectionViewCell
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

extension TrendingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presentCard(for: item)
    }
}
