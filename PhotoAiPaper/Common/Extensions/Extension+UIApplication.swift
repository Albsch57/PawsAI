//
//  Extension+UIApplication.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 23.08.2023.
//

import UIKit


extension UIApplication {
    
    var keyWindow: UIWindow? {
        
        if #available(iOS 15.0, *) {
            // Get connected scenes
            return self.connectedScenes
                // Keep only active scenes, onscreen and visible to the user
                .filter { $0.activationState == .foregroundActive }
                // Keep only the first `UIWindowScene`
                .first(where: { $0 is UIWindowScene })
                // Get its associated windows
                .flatMap({ $0 as? UIWindowScene })?.windows
                // Finally, keep only the key window
                .first(where: \.isKeyWindow)
        }
        
        else {
            return UIApplication.shared.windows.first(where: \.isKeyWindow)
        }
    }
    
}
