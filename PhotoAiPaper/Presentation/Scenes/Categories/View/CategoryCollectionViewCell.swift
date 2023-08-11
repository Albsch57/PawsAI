//
//  CategoryCollectionViewCell.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 29.07.2023.
//

import UIKit

final class CategoryCollectionViewCell: BaseImageCollectionViewCell {
    
    class override var reuseId: String {
        "BaseImageCollectionViewIdentifier"
    }
   
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .accentBlue
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryCollectionViewCell {
    var title: String {
        get { titleLabel.text ?? "" }
        set { titleLabel.text = newValue }
    }
}

extension CategoryCollectionViewCell {
    private func makeLayout() {
        layer.cornerRadius = 12
        
        layer.masksToBounds = true
        
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
