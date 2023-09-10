//
//  FirebaseMigrationManager.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 11.08.2023.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore

final class FirebaseMigrationManager {
    
    let firebaseStorageRepository: FirebaseStorageRepository
    
    var wallpapers = [String: [String]]()
    let db = Firestore.firestore()
    
    private var dispatchGroup = DispatchGroup()
    
    init(firebaseStorageRepository: FirebaseStorageRepository) {
        self.firebaseStorageRepository = firebaseStorageRepository
    }
    
    func startMigration() {
        firebaseStorageRepository.fetchReferences(for: .food) { references, error in
            for arrItem in references?.chunked(into: 4) ?? [] {
                for item in arrItem {
                    
                    self.dispatchGroup.enter()
                    
                    item.downloadURL { result in
                        
                        if case .success(let url) = result {
                          let fileName = self.getFileName(from: item)
                          
                            if self.wallpapers[fileName] == nil {
                                self.wallpapers[fileName] = [
                                    url.absoluteString
                                ]
                            } else {
                                self.wallpapers[fileName]!.append(url.absoluteString)
                            }
                        }
                        
                        self.dispatchGroup.leave()
                    }
                }
            }
            
            
            self.dispatchGroup.notify(queue: .main) {
                
                for (key, value) in self.wallpapers {
                    print(key, value)
                }
                
                
                self.insertToStore(for: .food, self.wallpapers)
                print("Законили!")
            }
        }
        
        
        
    }
    
    func insertToStore(for category: Category, _ data: [String: [String]]) {
        
        for (document, links) in data {
        
            
            let dict = links.reduce(into: [String: String]()) { partialResult, url in
                if url.localizedStandardContains("placeholder") {
                    partialResult["placeholder"] = url
                } else if url.localizedStandardContains("full") {
                    partialResult["full"] = url
                } else if url.localizedStandardContains("mini") {
                    partialResult["mini"] = url
                } else {
                    partialResult["original"] = url
                }
            }
            
            db.collection(category.rawValue.capitalized).document(document).setData(dict)
        }
    }
    
    func getFileName(from reference: StorageReference) -> String {
        
        var string = ""
        
        for character in reference.name {
            if ["@", "."].contains(character) {
                break
            }
            
            string += String(character)
        }
        
        return string
    }
}
