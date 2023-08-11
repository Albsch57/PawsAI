//
//  IntroductionCollectionViewCell.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 02.08.2023.
//

import UIKit

final class IntroductionCollectionViewCell: BaseImageCollectionViewCell {
    
    override class var reuseId: String {
        "BaseImageCollectionViewIdentifier"
    }
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        title.textColor = .accentBlue
        title.numberOfLines = 0
        title.textAlignment = .center
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with item: IntroductionItem) {
        switch item {
            
        case .embrace:
            image = UIImage(named: "introduction1")!
            titleLabel.text = "Embrace the beauty of every moment"
        case .discover:
            image = UIImage(named: "introduction2")!
            titleLabel.text = "Discover the nature through art and color"
        case .surround:
            image = UIImage(named: "introduction3")!
            titleLabel.text = "Surround yourself with animals world"
        }
        
        
    }
    
}


extension IntroductionCollectionViewCell {
    private func makeLayout() {
//        layer.cornerRadius = 12
//
 //      layer.masksToBounds = true
        
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
    //        imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 40),
            
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60)
        ])
        
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
    }
    
    //defaultLow
    //defaultHigh
    
}
