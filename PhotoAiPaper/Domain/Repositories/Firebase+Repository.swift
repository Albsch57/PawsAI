//
//  Repository.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 02.08.2023.
//

import FirebaseStorage

/// A protocol that defines methods for interacting with Firebase Storage to fetch storage references.
protocol FirebaseStorageRepository: AnyObject {
    /// Fetches storage references for a given category from Firebase Storage.
    ///
    /// - Parameters:
    ///   - category: The category for which storage references are to be fetched.
    ///   - completion: A closure to be called upon completion with an array of storage references or an error.
    func fetchReferences(for category: Category, _ completion: @escaping ([StorageReference]?, Error?) -> Void)
}

extension FirebaseStorageRepository where Self == FirebaseRepositoryImpl {
    /// A default shared instance of the `FirebaseRepositoryImpl` class conforming to `FirebaseStorageRepository` protocol.
    static var sharedDefault: Self {
        Self()
    }
}
