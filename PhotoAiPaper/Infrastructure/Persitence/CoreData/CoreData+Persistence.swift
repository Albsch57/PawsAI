//
//  CoreData+Persistence.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 07.08.2023.
//

import Foundation
import CoreData

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() { }
    
    private let persistentContainer = {
        let container = NSPersistentContainer(name: "WallpaperModel")
        container.loadPersistentStores { _, error in
            if let error {
                fatalError(error.localizedDescription)
            }
        }
        
        return container
    }()
    
}

extension CoreDataManager {
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
}
