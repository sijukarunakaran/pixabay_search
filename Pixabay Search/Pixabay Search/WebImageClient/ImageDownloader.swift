//
//  ImageDownloader.swift
//  ImageDownloader
//
//  Created by Siju on 18/12/20.
//

import UIKit

class ImageDownloader {

    private lazy var cache: NSCache<AnyObject, UIImage> = {
        let cache = NSCache<AnyObject, UIImage>()
        cache.totalCostLimit = 500
        return cache
    }()

    private var runningRequests = [UUID: URLSessionDataTask]()
    
    @discardableResult
    func loadImage(_ url: URL, _ completion: @escaping (Result<UIImage, Error>) -> Void) -> UUID? {
        if let image = cache.object(forKey: url as AnyObject) {
            completion(.success(image))
            return nil
        }
        let uuid = UUID()
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            defer {self.runningRequests.removeValue(forKey: uuid) }
            if let data = data, let image = UIImage(data: data) {
                self.cache.setObject(image, forKey: url as AnyObject)
                completion(.success(image))
                return
            }
            guard let error = error else {
                // without an image or an error, we'll just ignore this for now
                // you could add your own special error cases for this scenario
                return
            }
            guard (error as NSError).code == NSURLErrorCancelled else {
                completion(.failure(error))
                return
            }
            // the request was cancelled, no need to call the callback
        }
        task.resume()
        runningRequests[uuid] = task
        return uuid
    }
    
    func cancelLoad(_ uuid: UUID) {
      runningRequests[uuid]?.cancel()
      runningRequests.removeValue(forKey: uuid)
    }
}


