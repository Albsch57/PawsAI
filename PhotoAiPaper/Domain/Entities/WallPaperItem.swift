//
//  WalpaperItem.swift
//  PhotoAiPaper
//
//  Created by Alyona Bedrosova on 02.08.2023.
//

import Foundation
import SDWebImage

struct WallpaperUIItem {
    
    var documentID: String = ""
    var category: Category?
    private let placeholder: URL
    private let mini: URL
    private let full: URL
    private let original: URL
    
    init(category: Category, placeholder: URL, mini: URL, full: URL, original: URL) {
        self.placeholder = placeholder
        self.mini = mini
        self.full = full
        self.original = original
        self.category = category
    }
    
    enum WallpaperSize {
        case placeholder, mini, full, original
    }
    
    func image(for size: WallpaperSize, _ completion: @escaping (Result<UIImage?, Error>) -> Void) {
        let url = url(for: size)
        if size == .original {
            loadImage(for: url, completion)
            return
        }
        
        // Выдаем изображение напрямую из кэша без placeholder
        if let image = SDImageCache.shared.imageFromCache(forKey: url.absoluteString) {
            completion(.success(image))
            return
        }
        
        // First load
        else {
            
            // 1. Load fast placeholder
            SDWebImageManager.shared.loadImage(with: placeholder, progress: nil) { placeholderImage, _, error, _, _, _ in
                if let error {
                    completion(.failure(error))
                    return
                }
                
                // Выдаем placeholder
                if let placeholderImage {
                    completion(.success(placeholderImage.sd_blurredImage(withRadius: 2)))
                }
                
                // Грузим полноразмерное изображение
                loadImage(for: url, completion)
            }
        }
    }
    
    private func loadImage(for url: URL, _ completion: @escaping (Result<UIImage?, Error>) -> Void) {
        SDWebImageManager.shared.loadImage(with: url, progress: nil) { image, _, error, _, _, _ in
            if let error {
                completion(.failure(error))
                return
            }
            
            
            completion(.success(image))
        }
    }
    
    private func url(for size: WallpaperSize) -> URL {
        if size == .placeholder {
            return self.placeholder
        } else if size == .mini {
            return self.mini
        } else if size == .full {
            return self.full
        } else {
            return self.original
        }
    }
    
}


extension WallpaperUIItem: Codable {
    
    enum CodingKeys: String, CodingKey {
        case placeholder = "placeholder", mini, full, original
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        placeholder = URL(string: try container.decode(String.self, forKey: .placeholder))!
        mini = URL(string: try container.decode(String.self, forKey: .mini))!
        full = URL(string: try container.decode(String.self, forKey: .full))!
        original = URL(string: try container.decode(String.self, forKey: .original))!
    }
}
