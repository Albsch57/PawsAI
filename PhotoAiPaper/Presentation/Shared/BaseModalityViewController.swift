//
//  BaseModalityViewController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 28.08.2023.
//

import UIKit

class BaseModalityViewController: UIViewController {
    
    // Modal navigation bar
    private let navigationBar = UINavigationBar()
    private let navItem = UINavigationItem(title: "")
    
    //
    override var title: String? {
        get {
            navItem.title
        } set {
            navItem.title = newValue
        }
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        modalPresentationStyle = .fullScreen
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    @objc
    private func dismissController() {
        dismiss(animated: true)
    }

    
    private func configureNavigationBar() {

        view.addSubview(navigationBar)
        
        let appearence = UINavigationBarAppearance()
        appearence.configureWithTransparentBackground()
        
        navItem.standardAppearance = appearence
        navItem.compactAppearance = appearence
        navItem.scrollEdgeAppearance = appearence
        
        navigationBar.setItems([navItem], animated: false)
        navigationBar.delegate = self
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        
        let backButton = UIBarButtonItem(image: .init(systemName: "xmark.app", withConfiguration: UIImage.SymbolConfiguration(weight: .semibold)),  primaryAction: .init(handler: { [weak self]  _ in
            guard let self else { return }
            self.dismiss(animated: true)
        }))
        
        navItem.leftBarButtonItem = backButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            // в иерархии основной
        view.bringSubviewToFront(navigationBar)
    }
}

extension BaseModalityViewController: UINavigationBarDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        .topAttached
    }
}
