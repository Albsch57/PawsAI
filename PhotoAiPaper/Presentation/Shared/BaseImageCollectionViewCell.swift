//
//  BaseImageCollectionViewCell.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 29.07.2023.
//

import UIKit

class BaseImageCollectionViewCell: UICollectionViewCell {
    
    class var reuseId: String {
        "BaseImageCollectionViewIdentifier"
    }
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseImageCollectionViewCell {
    var image: UIImage? {
        get { imageView.image }
        set { imageView.image = newValue }
    }
}

extension BaseImageCollectionViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    
    
    
    private func makeLayout() {
        
        contentView.addSubview(imageView)
    }
}
