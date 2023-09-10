//
//  CardView.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 30.07.2023.
//

import UIKit

class CardView: UIView {
    
    let imageFont: UIImageView = {
        var image = UIImageView()
        image.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .gray
        return image
    }()
 
    let lookButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = .init(named: "look")
        return UIButton(configuration: configuration)
    }()
    
    let downloadButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = .init(named: "download")
        return UIButton(configuration: configuration)
    }()
    
    let favoriteButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = .init(named: "save")
        return UIButton(configuration: configuration)
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageFont.frame = bounds
    }
}

extension CardView {
    func makeLayout() {
        
        addSubview(imageFont)
        stackView.addArrangedSubview(lookButton)
        stackView.addArrangedSubview(downloadButton)
        stackView.addArrangedSubview(favoriteButton)
        addSubview(stackView)
        

        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -136)
            
        ])
    }
    
}


