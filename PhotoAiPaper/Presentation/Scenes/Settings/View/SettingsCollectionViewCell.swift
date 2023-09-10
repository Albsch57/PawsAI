//
//  SettingsCollectionViewCell.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 30.07.2023.
//

import UIKit

protocol SettingsCollectionViewCellDelegate: AnyObject {
    func settingsCellButtonTapped(_ cell: SettingsCollectionViewCell)
}

class SettingsCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "settingCell"
    
    weak var delegate: SettingsCollectionViewCellDelegate?
    
    let imageIcon: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let buttonIcon: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.baseBackgroundColor = .accentBlue
        configuration.baseForegroundColor = .accentBlue
        return UIButton(configuration: configuration)
    }()
    
    let modeSwitch: UISwitch = {
        let modeSwitch = UISwitch()
        modeSwitch.translatesAutoresizingMaskIntoConstraints = false
        modeSwitch.isOn = ThemeService.shared.currentTheme == .dark
        return modeSwitch
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeLayout()
        buttonIcon.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        modeSwitch.addTarget(self, action: #selector(buttonTapped), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with item: SettingsItem) {
        switch item {
        case .tell:
            imageIcon.image = UIImage(named: "tell")!
            buttonIcon.setTitle("Tell a friend", for: .normal)
        case .feedback:
            imageIcon.image = UIImage(named: "feedback")
            buttonIcon.setTitle("Feedback", for: .normal)
        case .about:
            imageIcon.image = UIImage(named: "about")
            buttonIcon.setTitle("About us", for: .normal)
        case .mode:
            imageIcon.image = UIImage(named: "mode")
            buttonIcon.setTitle("Night Mode", for: .normal)
            
            contentView.addSubview(modeSwitch)
            
            NSLayoutConstraint.activate([
                modeSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                modeSwitch.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        }
        
        
    }
    //    func configure(image: UIImage, button: String) {
    //        imageIcon.image = image
    //        buttonIcon.setTitle(button, for: .normal)
    //    }
}

extension SettingsCollectionViewCell {
    private func makeLayout() {
        
        contentView.backgroundColor = .systemGray6
        layer.cornerRadius = 15
        layer.masksToBounds = true
        contentView.addSubview(imageIcon)
        contentView.addSubview(buttonIcon)
        
        buttonIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageIcon.widthAnchor.constraint(equalToConstant: 24),
            imageIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageIcon.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            buttonIcon.leadingAnchor.constraint(equalTo: imageIcon.trailingAnchor, constant: 16),
            buttonIcon.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            //          buttonIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            buttonIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            
        ])
        
        
    }
    
    @objc private func buttonTapped() {
        delegate?.settingsCellButtonTapped(self)
    }
    

    
}
