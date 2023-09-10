////
////  WallpaperUseCase.swift
////  PhotoAiPaper
////
////  Created by Alyona Bedrosova on 09.08.2023.
////
//
//import Foundation
//import FirebaseStorage
//
//// работа с синхронизацией репозиториев
//final class WallpaperUseCase {
//    private let firebaseRepository: FirebaseStorageRepository
//    private let coreDataRepository: CoreDataRepository
//    
//    init(firebaseRepository: FirebaseStorageRepository, coreDataRepository: CoreDataRepository) {
//        self.firebaseRepository = firebaseRepository
//        self.coreDataRepository = coreDataRepository
//    }
//   
//    func fetchWallpaper(for category: Category, _ completion: @escaping WallpaperUIFetcher) {
//        
//        // Check core data
//        /// category
//        /// return [WallpaperUI]
//        
//        firebaseRepository.fetchReferences(for: category) { [weak self] storageReferences, error in
//            guard let self else { return }
//            
//            if let error {
//                completion([], error)
//                return
//            }
//            
//            let wallpaperItems = self.makeWallpaperUIItems(from: storageReferences ?? [])
//            completion(wallpaperItems, nil)
//        }
//    }
//    
//    /// Creates an array of `WallpaperUIItem` instances from an array of `StorageReference` instances.
//    ///
//    /// - Parameters:
//    ///   - references: An array of `StorageReference` instances representing image references.
//    ///
//    /// - Returns: An array of `WallpaperUIItem` instances, each containing image requests.
//    private func makeWallpaperUIItems(from references: [StorageReference]) -> [WallpaperUIItem] {
//        // Divide the references into chunks of 4 and then create WallpaperUIItem instances
//        return references.chunked(into: 4).map { storageReferences in
//            // Create an array of image requests using the storage references
//            let imageRequests = storageReferences.map { makeFirebaseDownloadURL(with: $0) }
//            // Return a WallpaperUIItem instance with the image requests
//            return WallpaperUIItem(requests: imageRequests)
//        }
//    }
//
//    }
//    
//    /// Creates a download URL for a given storage reference based on the file name.
//    /// - Parameters:
//    ///   - storageReference: The reference to the Firebase Storage file.
//    private func makeFirebaseDownloadURL(with storageReference: StorageReference) -> WallpaperUIItem.ImageRequest {
//        if storageReference.name.localizedStandardContains("full") {
//            return .full(storageReference.downloadURL(completion:))
//        } else if storageReference.name.localizedStandardContains("mini") {
//            return .mini(storageReference.downloadURL(completion:))
//        } else if storageReference.name.localizedStandardContains("placeholder") {
//            return .placeholder(storageReference.downloadURL(completion:))
//        } else {
//            return .original(storageReference.downloadURL(completion:))
//        }
//    }
//
//
//
//// допиши комментарии к данной функции включая params у названия функции и все аргументы в стиле xcode на английском языке
//// включая полный стиль с аргмуентами /// - Parameters:
/////     - subject: The subject to be welcomed.
/////
///// - Returns: A greeting for the given `subject`.
