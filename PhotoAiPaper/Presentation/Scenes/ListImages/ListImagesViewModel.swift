//
//  ListImagesViewModel.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 11.08.2023.
//

import Foundation
import FirebaseFirestoreSwift

final class ListImagesViewModel {
    private let firestoreRepository: FirestoreDatabase
    
    init(firestoreRepository: FirestoreDatabase = .sharedDefault) {
        self.firestoreRepository = firestoreRepository
    }
    
    func wallpapers(for category: Category, completion: @escaping ([WallpaperUIItem]?, Error?) -> Void) {
        
        firestoreRepository.documents(for: category) { queryDocumentSnapshots, error in
            guard let queryDocumentSnapshots else {
                completion(nil, error)
                return
            }
            
            let items = queryDocumentSnapshots.compactMap({ queryDocumentSnapshot -> WallpaperUIItem? in
                var item = try? queryDocumentSnapshot.data(as: WallpaperUIItem.self)
                item?.documentID = queryDocumentSnapshot.documentID
                item?.category = category
                return item
            })
            
            completion(items, nil)
        }
        
    }
}
