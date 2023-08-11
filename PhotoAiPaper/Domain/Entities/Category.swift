//
//  Category.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 29.07.2023.
//

import UIKit

enum Category: String, CaseIterable {
    case food = "Food", nature, work, rest, abstract, vehicles, space, art, entertainment, travel
    
    var title: String {
        switch self {
        case .art: return "Art and Illustration"
        default: return self.rawValue.capitalized
        }
    }
}

extension Category {
    var image: UIImage? {
        .init(named: rawValue.capitalized)
    }
}
