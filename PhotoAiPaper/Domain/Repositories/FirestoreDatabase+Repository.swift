//
//  FirestoreDatabase+Repository.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 11.08.2023.
//

import Foundation
import FirebaseFirestore

protocol FirestoreDatabase: AnyObject {
    func documents(for category: Category, _ completion: @escaping ([QueryDocumentSnapshot]?, Error?) -> Void)
    func increaseScore(for documentID: String, collection: String)
    func fetchTrendingDocuments(_ completion: @escaping ([DocumentSnapshot]?, Error?) -> Void)
}

extension FirestoreDatabase where Self == FirebaseDatabaseImpl {
    static var sharedDefault: Self { Self() }
}
