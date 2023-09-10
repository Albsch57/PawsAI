//
//  LookPageItem.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 27.08.2023.
//

import UIKit

enum LookPageItem {
    case date, time, icons
    
    var title: String {
        switch self {
        case .date:
            return ""
        case .time:
            return ""
        case .icons:
            return ""
        }
    }
    
}
