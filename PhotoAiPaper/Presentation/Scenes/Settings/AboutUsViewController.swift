//
//  AboutUsViewController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 06.08.2023.
//

import UIKit

class AboutUsViewController: UIViewController {

    
    private let descriptioneOne: UILabel = {
        let label = UILabel()
        label.text = "Dear users,\n\n We are a team of developers of the application Paws Parade and want to thank you for the active use of our application! We are glad that you find it useful and interesting. We want to give you a unique opportunity to share your experience of using our application. All of our images are made with AI.\n\n Please leave your comments, impressions and suggestions for improvement. We look forward to your opinions and feedback, which will help us make Smart Intelligence even better!\n\n Thank you for being with us! Together we can make Smart Intelligence the best tool for your everyday experience.\n\n Sincerely, Team Intellectual Intellect"
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "About us"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGroupedBackground
        makeLayout()
    }
    
}

extension AboutUsViewController {
    private func makeLayout() {
        view.addSubview(descriptioneOne)
        descriptioneOne.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptioneOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            descriptioneOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            descriptioneOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
    }
}
