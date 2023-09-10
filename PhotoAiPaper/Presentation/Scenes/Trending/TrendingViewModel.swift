//
//  TrendingViewModel.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 10.09.2023.
//

import Foundation
import FirebaseFirestoreSwift

final class TrendingViewModel {
    private let firestoreRepository: FirestoreDatabase
    
    init(firestoreRepository: FirestoreDatabase = .sharedDefault) {
        self.firestoreRepository = firestoreRepository
    }
    
    func fetchTrendingDocuments(completion: @escaping ([WallpaperUIItem]?, Error?) -> Void) {
        firestoreRepository.fetchTrendingDocuments { results, error in
            let wallpapers = results?.compactMap { document in
                var wallpaper = try? document.data(as: WallpaperUIItem.self)
                wallpaper?.documentID = document.documentID
                return wallpaper
            }
            completion(wallpapers, error)
        }
    }
}
