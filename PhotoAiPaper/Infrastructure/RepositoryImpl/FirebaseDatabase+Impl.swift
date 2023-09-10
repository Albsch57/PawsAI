//
//  FirebaseDatabase+Impl.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 11.08.2023.
//

import Foundation
import FirebaseFirestore

final class FirebaseDatabaseImpl: FirestoreDatabase {
    
    private let db = Firestore.firestore()
    
    func documents(for category: Category, _ completion: @escaping ([QueryDocumentSnapshot]?, Error?) -> Void) {
        
       
        
        //        // Получаете список документов в коллекции
        //        db.collection("Trending").getDocuments { snapshot, error in
        //
        //            var documents = [DocumentSnapshot]()
        //
        //            // Проходитесь циклом по документам
        //            for documentRef in snapshot?.documents ?? [] {
        //
        //                // Ссылка на текущий документ
        //                let ref = documentRef["ref"] as? DocumentReference
        //
        //
        //                // Извлекаете документ по ссылке
        //                ref?.getDocument(completion: { wallpaperDocument, error in
        //                    if let wallpaperDocument {
        //                        documents.append(wallpaperDocument)
        //                    }
        //                })
        //            }
        //
        //            // -> WAll
        //         //   completion(documents)
        //
        //        }
        
        db.collection(category.rawValue.capitalized).getDocuments(source: .cache) { querySnapshot, error in
            if let error {
                completion(nil, error)
                return
            }
            
            if let querySnapshot {
                completion(querySnapshot.documents, nil)
            }
        }
    }
    
    func increaseScore(for documentID: String, collection: String) {
        let documentRef = db.collection("Trending").document(documentID)
        let sourceDocumentRef = db.collection(collection).document(documentID)
        
        // Извлекаем документ
        documentRef.getDocument(completion: { documentSnapshot, error in
            
            // Если счетчик уже был, увеличиваем на 1
            if let score = documentSnapshot?.get("score") as? Int {
                documentRef.setData([
                    "score": score + 1,
                    "ref": sourceDocumentRef,
                    // ДОБАВЬТЕ ТЕКСТ КАТЕГОРИЮ!!!!
                ])
            } else {
                
                // Ставим данные по умолчанию, и ref надо еще проставить
                documentRef.setData([
                    "score": 1,
                    "ref": sourceDocumentRef
                ])
            }
        })
    }
    
    func fetchTrendingDocuments(_ completion: @escaping ([DocumentSnapshot]?, Error?) -> Void) {
        // При отображении страницы trending получаем список установленных картинок на устройствах по количеству раз
        db.collection("Trending").order(by: "score", descending: true).limit(to: 20).getDocuments { snapshot, error in
            if let error {
                completion(nil, error)
                return
            }
            
            let referencedDocuments = snapshot?.documents.compactMap({ snapshot in
                snapshot.get("ref") as? DocumentReference
            })
            
            let dispatchGroup = DispatchGroup()
            var documents = [DocumentSnapshot]()
            
            referencedDocuments?.forEach({ documentReference in
                dispatchGroup.enter()
                documentReference.getDocument { snapshot, error in
                    if let snapshot {
                        documents.append(snapshot)
                    }
                    
                    dispatchGroup.leave()
                }
            })
            
            dispatchGroup.notify(queue: .global()) {
                completion(documents, nil)
            }
            
            
        }
    }
    
    
}
