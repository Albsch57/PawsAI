//
//  CloudImageRepository.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 31.07.2023.
//

import FirebaseStorage

/// A concrete implementation of the `FirebaseStorageRepository` protocol that interacts with Firebase Storage.
final class FirebaseRepositoryImpl: FirebaseStorageRepository {
    private let storage = Storage.storage()
    
    /// Fetches storage references for a given category from Firebase Storage.
    ///
    /// - Parameters:
    ///   - category: The category for which storage references are to be fetched.
    ///   - completion: A closure to be called upon completion with an array of storage references or an error.
    func fetchReferences(for category: Category, _ completion: @escaping ([StorageReference]?, Error?) -> Void) {
        // Create a reference to the category folder in Firebase Storage
        let rootReference = storage.reference().child(AppConfig.rootCategoryPath).child(category.rawValue.capitalized)
        
        // List all items in the category folder
        rootReference.listAll { listResult, error in
            // Handle any errors that might occur during listing
            if let error = error {
                completion(nil, error)
                return
            }
            
            // Get the array of references from the list result, or an empty array if none are found
            var references = listResult?.items ?? []
            
            // Sort the references based on numeric values in their names
            references.sort { referenceOne, referenceTwo in
                let numbersOfReferenceOne = Int(referenceOne.name.filter { $0.isNumber }) ?? 0
                let numbersOfReferenceTwo = Int(referenceTwo.name.filter { $0.isNumber }) ?? 0
                
                return numbersOfReferenceOne < numbersOfReferenceTwo
            }
            
            // Call the completion closure with the sorted references and no error
            completion(references, nil)
        }
    }
}

