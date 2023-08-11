////
////  ImageLoader.swift
////  PhotoAiPaper
////
////  Created by Alyona Bedrosova on 09.08.2023.
////
//
//import Foundation
//
//protocol WallpaperUIImageLoader: AnyObject {
//    associatedtype ImageSize: RawRepresentable
//    func image(for size: ImageSize, _ completion: (@escaping (URL?, Error?) -> Void) -> Void)
//}
//
//
//final class ImageLoader: WallpaperUIImageLoader {
//
//    typealias CallbackLoader = (@escaping ImageDownloadLoader) -> Void
//
//    private let loaders: [ImageSize: CallbackLoader]
//
//    init(loaders: [ImageSize : CallbackLoader]) {
//        self.loaders = loaders
//    }
//
//    enum ImageSize: String {
//        case original, full, mini, placeholder
//
//        init?(from string: String) {
//            if string.localizedStandardContains(ImageSize.placeholder.rawValue) {
//                self = .placeholder
//            } else if string.localizedStandardContains(ImageSize.full.rawValue) {
//                self = .full
//            } else if string.localizedStandardContains(ImageSize.mini.rawValue) {
//                self = .mini
//            }  else {
//                self = .original
//            }
//        }
//    }
//
//    func image(for size: ImageSize, _ completion: (@escaping (URL?, Error?) -> Void) -> Void) {
//        <#code#>
//    }
//
//}
