//
//  ThemeService.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 23.08.2023.
//

import UIKit

protocol ThemeServiceInterface {
    var currentTheme: UIUserInterfaceStyle { get }
    func setTheme(_ style: UIUserInterfaceStyle)
}

final class ThemeService: ThemeServiceInterface {
    
    static let shared = ThemeService()
    
    private init() { }
    
    var window: UIWindow? {
        UIApplication.shared.keyWindow
    }
    
    var currentTheme: UIUserInterfaceStyle {
        window?.traitCollection.userInterfaceStyle ?? .light
    }
    
    func setTheme(_ style: UIUserInterfaceStyle) {
        guard let window = UIApplication.shared.keyWindow else { return }
        UserDefaults.appTheme = style.rawValue
        
        UIView.animate(withDuration: 0.5) {
            window.overrideUserInterfaceStyle = style
        }
        
    }
}
