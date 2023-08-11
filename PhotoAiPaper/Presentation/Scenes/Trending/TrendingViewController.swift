//
//  TrendingViewController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 29.07.2023.
//

import UIKit

class TrendingViewController: BaseViewController {
    
    private let dataSource = DataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

       
        navigationItem.title = "Trending"
        
        collectionView.register(BaseImageCollectionViewCell.self, forCellWithReuseIdentifier: BaseImageCollectionViewCell.reuseId)
        collectionView.dataSource = dataSource
        collectionView.setCollectionViewLayout( CollectionLayout.columns(.two).layout, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showIntroduction()
    }
    
}

extension TrendingViewController {
    private func showIntroduction() {
        guard UserDefaults.standard.bool(forKey: "introductionIsPresented") == false else { return }
        let introduction = IntroductionViewController()
        navigationController?.present(introduction, animated: false, completion: {
            UserDefaults.standard.set(true, forKey: "introductionIsPresented")
        })
    }
}
