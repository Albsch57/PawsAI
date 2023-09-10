//
//  LookPageViewController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 27.08.2023.
//

import UIKit

class LookPageViewController: BaseModalityViewController {

    private let collectionView = UICollectionView.makeBaseCollectionView()

    private let dataSource = DataSource()
    
    var wallpaper: WallpaperUIItem! = nil
    
    private let pageIndicator: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .accentBlue
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.transform = CGAffineTransform.init(scaleX: 2, y: 2)
    
        return pageControl
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        configureSubviews()
        collectionView.register(LookPageCollectionViewCell.self, forCellWithReuseIdentifier: LookPageCollectionViewCell.reuseId)
        
        collectionView.dataSource = dataSource
        
        let pageUpdater: (Int) -> Void = { [weak pageIndicator] pageIndex in
            pageIndicator?.currentPage = pageIndex
        }
        
        collectionView.setCollectionViewLayout(CollectionLayout.introduction(pageUpdater).layout, animated: true)
        
        wallpaper.image(for: .full) { result in
            if case .success(let image) = result {
                self.backgroundImageView.image = image
            }
        }
        
       
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        backgroundImageView.frame = view.bounds
        collectionView.frame = view.bounds
    }
    
  
}

extension LookPageViewController {
    private func configureSubviews() {
        
        
        // ОТКЛЮЧАЕМ автоматическую подгонку контента под безопасную зону
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.frame = view.bounds
        
        
        backgroundImageView.frame = view.bounds
        view.addSubview(backgroundImageView)
        
        //выведет коллекцию (UIView) выше в приоритете по Z index
        // view.bringSubviewToFront(collectionView)
        view.addSubview(collectionView)
        
        view.addSubview(pageIndicator)
        
        
        
       //       pageIndicator.backgroundColor = .white
        
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
        pageIndicator.translatesAutoresizingMaskIntoConstraints = false
       
        
        NSLayoutConstraint.activate([

            pageIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageIndicator.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            
           
        ])
        
        pageIndicator.numberOfPages = dataSource.items.count

    }
}
