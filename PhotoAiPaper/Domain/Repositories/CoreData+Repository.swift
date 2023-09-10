////
////  CoreData+Repository.swift
////  PhotoAiPaper
////
////  Created by Alyona Bedrosova on 07.08.2023.
////
//
//import CoreData
//
///// A protocol that defines methods for interacting with Core Data to manage wallpapers.
//protocol CoreDataRepository: AnyObject {
//    /// Fetches wallpapers from Core Data based on the given predicate.
//    ///
//    /// - Parameter predicate: An optional predicate to filter the fetched wallpapers.
//    /// - Returns: An array of `Wallpaper` instances fetched from Core Data.
//    func fetchWallpapers(predicate: NSPredicate?) -> [Wallpaper]
//    
//    /// Creates a new `Wallpaper` instance in Core Data with the provided cloud URL and favorite status.
//    ///
//    /// - Parameters:
//    ///   - cloudUrl: The cloud URL for the wallpaper image.
//    ///   - isFavorite: The favorite status of the wallpaper.
//    /// - Returns: The newly created `Wallpaper` instance.
//    func makeWallpaper(cloudUrl: URL, isFavorite: Bool) -> Wallpaper
//    
//    /// Updates an existing `Wallpaper` instance in Core Data with the provided cloud URL and favorite status.
//    ///
//    /// - Parameters:
//    ///   - wallpaper: The `Wallpaper` instance to be updated.
//    ///   - cloudUrl: The new cloud URL for the wallpaper image.
//    ///   - isFavorite: The new favorite status of the wallpaper.
//    func updateWallpaper(_ wallpaper: Wallpaper, cloudUrl: URL, isFavorite: Bool)
//    
//    /// Removes a `Wallpaper` instance from Core Data.
//    ///
//    /// - Parameter wallpaper: The `Wallpaper` instance to be removed.
//    func removeWallpaper(_ wallpaper: Wallpaper)
//}
//
//extension CoreDataRepository where Self == CoreDataRepositoryImpl {
//    /// A default shared instance of the `CoreDataRepositoryImpl` class conforming to `CoreDataRepository` protocol.
//    static var sharedDefault: Self {
//        Self()
//    }
//}
