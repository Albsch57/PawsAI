//
//  IntroductionViewController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 02.08.2023.
//

import UIKit

class IntroductionViewController: BaseViewController {
    
    private let dataSource = DataSource()
    
    private let pageIndicator: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .accentBlue
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.transform = CGAffineTransform.init(scaleX: 3, y: 3)
    
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
        collectionView.register(IntroductionCollectionViewCell.self, forCellWithReuseIdentifier: IntroductionCollectionViewCell.reuseId)
        
        collectionView.dataSource = dataSource
        
        let pageUpdater: (Int) -> Void = { [weak pageIndicator] pageIndex in
            pageIndicator?.currentPage = pageIndex
        }
        
        collectionView.setCollectionViewLayout(CollectionLayout.introduction(pageUpdater).layout, animated: true)
    }
 
}

extension IntroductionViewController {
    
    
    private func configureSubviews() {
        
       // collectionView.backgroundColor = .white
        
        view.addSubview(pageIndicator)
        
        //       pageIndicator.backgroundColor = .white
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        pageIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: pageIndicator.topAnchor),
            
            //pageIndicator.heightAnchor.constraint(equalToConstant: 70),
            pageIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageIndicator.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
        
        pageIndicator.numberOfPages = dataSource.items.count

    }
}


