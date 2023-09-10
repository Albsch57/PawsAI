//
//  BaseViewController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 30.07.2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    let collectionView = UICollectionView.makeBaseCollectionView()
    
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
    
    open func makeLogo() {
        let image = UIImage(named: "icon")
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        
        navigationItem.titleView = imageView
    }
    
    
}

extension BaseViewController {
    
    private func makeCollection() {
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
    }
}
