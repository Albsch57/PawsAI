//
//  WalpaperItem.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 02.08.2023.
//

import Foundation



struct WallpaperUIItem {
    
    typealias ImageCallbackLoader = (@escaping (URL?, Error?) -> Void) -> Void
    private let requests: [ImageRequest]
    
    init(requests: [ImageRequest]) {
        self.requests = requests
    }
    
    enum ImageRequest {
        case original(ImageCallbackLoader)
        case full(ImageCallbackLoader)
        case mini(ImageCallbackLoader)
        case placeholder(ImageCallbackLoader)
    }
}


extension WallpaperUIItem {
    
    func imagePlaceholder(callback: @escaping ImageDownloadLoader) {
        for request in requests {
            if case .placeholder(let requestCallback) = request {
                requestCallback(callback)
                break
            }
        }
    }
    
    func imageFull(callback: @escaping ImageDownloadLoader) {
        for request in requests {
            if case .full(let requestCallback) = request {
                requestCallback(callback)
                break
            }
        }
    }
    
    func imagePreview(callback: @escaping ImageDownloadLoader) {
        for request in requests {
            if case .mini(let requestCallback) = request {
                requestCallback(callback)
                break
            }
        }
    }
    
    func imageOriginal(callback: @escaping ImageDownloadLoader) {
        for request in requests {
            if case .original(let requestCallback) = request {
                requestCallback(callback)
                break
            }
        }
    }
}
