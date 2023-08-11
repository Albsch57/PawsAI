//
//  CardViewController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 30.07.2023.
//

import UIKit

class CardViewController: UIViewController {
    
    private let cardView = CardView()
    
    override func loadView() {
        view = CardView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        cardView.lookButton.addTarget(self, action: #selector(lookButtonTapped), for: .touchUpInside)
        cardView.downloadButton.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
        cardView.favoriteButton.addTarget(self, action: #selector(favoriteButtontapped), for: .touchUpInside)
    }


}

extension CardViewController {
    @objc
    private func lookButtonTapped() {
        
    }
    
    @objc
    private func downloadButtonTapped() {
        
    }
    
    @objc
    private func favoriteButtontapped() {
        
    }
}
