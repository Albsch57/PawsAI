//
//  Wallpaper+CoreDataProperties.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 07.08.2023.
//
//

import Foundation
import CoreData


extension Wallpaper {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wallpaper> {
        return NSFetchRequest<Wallpaper>(entityName: "Wallpaper")
    }

    @NSManaged public var id: UUID
    @NSManaged public var cloudUrl: URL
    @NSManaged public var isFavorite: Bool

}

extension Wallpaper : Identifiable {

}
