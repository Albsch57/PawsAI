//
//  UserDefaultsManager.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 21.08.2023.
//

import UIKit

@propertyWrapper
struct UserDefault<Value> {

    let key: String
    let defaultValue: Value
    var container: UserDefaults = .standard
    

    var wrappedValue: Value {
        get { container.object(forKey: key) as? Value ?? defaultValue }
        set { container.set(newValue, forKey: key) }
    }
}

extension UserDefaults {
    
    @UserDefault(key: "trendingWallpaper", defaultValue: [])
    static var trendingItems: [Data]
    
    @UserDefault(key: "introductionIsPresented", defaultValue: false)
    static var introductionIsPresented: Bool
    
    
    @UserDefault(key: "appTheme", defaultValue: 1)
    static var appTheme: Int
    
    @UserDefault(key: "favoritesWallpaper", defaultValue: [])
    static var favoritesItems: [Data]
}
