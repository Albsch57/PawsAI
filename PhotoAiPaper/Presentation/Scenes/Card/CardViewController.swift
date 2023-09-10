//
//  CardViewController.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 30.07.2023.
//

import UIKit
import Photos

class CardViewController: BaseModalityViewController {
    
    var wallpaper: WallpaperUIItem! = nil
    
    private let viewModel = CardViewModel()
    
    
    private var cardView: CardView {
        view as! CardView
    }
    
    override func loadView() {
        view = CardView()
    }
    
    var wallpaperIsFavorite: Bool {
        guard let jsonData = try? JSONEncoder().encode(wallpaper) else { return false }
        return UserDefaults.favoritesItems.contains(jsonData)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        //                let cardNavigationController = UINavigationController()
        //
        //                // Создаем экземпляр CardViewController
        //                let cardViewController = CardViewController()
        //
        //                // Вставляем CardViewController в навигационный контроллер
        //                cardNavigationController.setViewControllers([cardViewController], animated: false)
        //
        //
        
        
        wallpaper.image(for: .full) { [weak cardView] result in

            if case .success(let image) = result {
                cardView?.imageFont.image = image

                print(cardView, "LOAD", image)
            }

            else if case .failure(let failure) = result {
                print(failure, "ОШИБКА")

            }
        }
 
        cardView.favoriteButton.configuration?.image = .init(named: wallpaperIsFavorite ? "saveFull" : "save")

        cardView.lookButton.addTarget(self, action: #selector(lookButtonTapped), for: .touchUpInside)
        cardView.downloadButton.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
        cardView.favoriteButton.addTarget(self, action: #selector(favoriteButtontapped), for: .touchUpInside)
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//
//    }
}

extension CardViewController {
//    @objc private func closeButtonTapped() {
//        dismiss(animated: true, completion: nil)
//    }
    
    
    @objc
    private func lookButtonTapped() {
        
        let lookPageViewController = LookPageViewController()
        lookPageViewController.wallpaper = wallpaper
        
        
        present(lookPageViewController, animated: true, completion: nil)
        //            wallpaper.image(for: .full) { [weak self, weak lookPageViewController] result in
        //                guard let self = self else { return }
        //
        //                switch result {
        //                case .success(let image):
        //        //            self.fullSizeImage = image
        //
        //        //            lookPageViewController?.fullSizeImage = image
        //                    self.present(lookPageViewController!, animated: true, completion: nil)
        //
        //                case .failure(let error):
        //                    print(error)
        //                }
        //            }
    }
    
    @objc
    private func downloadButtonTapped() {
        
        if PHPhotoLibrary.authorizationStatus(for: .addOnly) != .authorized {
            
            PHPhotoLibrary.requestAuthorization(for: .addOnly) { [weak self] status in
                guard status == .authorized else  {
                    let alert = UIAlertController(title: "Oops...", message: "Мы не можем сохранить фото на ваше устройство без Вашего одобрения.", preferredStyle: .actionSheet)
                    
                    let goToSettings = UIAlertAction(title: "Go to Settings", style: .default) { _ in
                        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                            return
                        }
                        
                        if UIApplication.shared.canOpenURL(settingsUrl) {
                            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                                print("Settings opened: \(success)") // Prints true
                            })
                        }
                    }
                    
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                    
                    alert.addAction(goToSettings)
                    alert.addAction(cancelAction)
                    self?.present(alert, animated: true)
                    return
                }
            }
            
        }
        
        wallpaper.image(for: .original) { [weak self] result  in
            guard let self else { return }
            if case .success(let image) = result, let image {
                UIImageWriteToSavedPhotosAlbum(image, nil, #selector(self.saveWasSuccessAddedToPhotoLibrary), nil)
                
                self.saveWasSuccessAddedToPhotoLibrary()
                
            } else if case .failure(let failure) = result {
                print(failure)
                
            }
        }
        
        print("Попытка сохранения ")
    }
    
    @objc
    private func saveWasSuccessAddedToPhotoLibrary() {
        print("Картинка успешно загружена!")
        viewModel.increaseScore(for: wallpaper.documentID, collection: wallpaper.category!.title)
        
//        let repository = FirebaseDatabaseImpl()
//        repository.increaseScore(for: wallpaper.documentID, collection: wallpaper.category!.title)
        
    }
    
    @objc
    private func favoriteButtontapped() {
        var favoriteItems = UserDefaults.favoritesItems
        guard let jsonData = try? JSONEncoder().encode(wallpaper) else { return }
        
        if let index = favoriteItems.firstIndex(of: jsonData) {
            favoriteItems.remove(at: index)
            cardView.favoriteButton.configuration?.image = .init(named: "save")
        } else {
            favoriteItems.append(jsonData)
            cardView.favoriteButton.configuration?.image = .init(named: "saveFull")
        }
        
        UserDefaults.favoritesItems = favoriteItems
    }
}
