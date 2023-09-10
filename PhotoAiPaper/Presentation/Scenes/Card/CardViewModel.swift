//
//  CardViewModel.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 04.09.2023.
//

import Foundation
import FirebaseFirestoreSwift

final class CardViewModel {
    private let firestoreRepository: FirestoreDatabase
  
    init(firestoreRepository: FirestoreDatabase = .sharedDefault) {
        self.firestoreRepository = firestoreRepository
    }
    
    func increaseScore(for documentID: String, collection: String) {
        firestoreRepository.increaseScore(for: documentID, collection: collection)
    }
}
