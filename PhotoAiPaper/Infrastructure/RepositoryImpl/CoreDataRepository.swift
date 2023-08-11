//
//  CoreDataRepository.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 07.08.2023.
//

import CoreData

final class CoreDataRepositoryImpl: CoreDataRepository {
    
    func fetchWallpapers(predicate: NSPredicate?) -> [Wallpaper] {
        []
    }
    
    func makeWallpaper(cloudUrl: URL, isFavorite: Bool) -> Wallpaper {
        .init()
    }
    
    func updateWallpaper(_ wallpaper: Wallpaper, cloudUrl: URL, isFavorite: Bool) {
        //
    }
    
    func removeWallpaper(_ wallpaper: Wallpaper) {
        //
    }
    
}
