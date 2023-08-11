//
//  BaseViewController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 30.07.2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.alwaysBounceVertical = false
        return collectionView
    }()
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.accentBlue
        ]
        navigationController?.navigationBar.prefersLargeTitles = true
        
        makeLogo()
        makeCollection()
    }
    
}


extension BaseViewController {
    private func makeLogo() {
        let image = UIImage(named: "icon")

        let imageView = UIImageView(image: image)
        imageView.contentMode = .center

        navigationItem.titleView = imageView
    }
    
    private func makeCollection() {
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
    }
}
