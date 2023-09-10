//
//  LookPageCollectionViewCell.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 27.08.2023.
//

import UIKit

class LookPageCollectionViewCell: BaseImageCollectionViewCell {
    
    override class var reuseId: String {
        "LookPageCollectionViewIdentifier"
    }

    private let titleAndTimeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        title.textColor = .white
        title.numberOfLines = 0
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let timeLabel: UILabel = {
        let time = UILabel()
        time.font = UIFont.systemFont(ofSize: 100, weight: .bold)
        time.textColor = .white
        time.numberOfLines = 0
        time.textAlignment = .center
        time.translatesAutoresizingMaskIntoConstraints = false
        return time
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configure(with item: LookPageItem) {
        switch item {
            
        case .time:
            
            titleLabel.text = "Monday, December 10 10:10"
            
            
        case .icons:
           
            imageView.image = UIImage(named: "homeScreen")!
            imageView.contentMode = .scaleAspectFit
        }
        

    }
    
}

extension LookPageCollectionViewCell {
    private func makeLayout() {
        //        layer.cornerRadius = 12
        //
        //      layer.masksToBounds = true
        
       
        
       
        contentView.addSubview(titleAndTimeStackView)
        titleAndTimeStackView.addArrangedSubview(titleLabel)
        titleAndTimeStackView.addArrangedSubview(timeLabel)
        

      
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
           
           
            
            titleAndTimeStackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 32),
            titleAndTimeStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleAndTimeStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            //              titleAndTimeStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
            
        ])
        
        //        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        //        titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
    }
    
    @objc private func buttonTapped() {
        var responder: UIResponder? = self
        while responder != nil {
            if let viewController = responder as? UIViewController {
                viewController.dismiss(animated: true, completion: nil)
                break
            }
            responder = responder?.next
        }
    }
}
