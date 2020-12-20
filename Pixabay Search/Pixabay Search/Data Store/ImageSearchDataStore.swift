//
//  ImageSearchDataStore.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import Foundation

class ImageSearchDataStore: DataStore{
    typealias DataType = ImageSearchResponse
    
    typealias DataTypeCollection = ImageSearchResponse
    
    func getAll(keyword: String, page: Int, completion: @escaping (() throws -> ImageSearchResponse) -> Void) {
        let request = GetImages(
            queryParams: GetImages.QueryParams(
                keyword: keyword,
                page: page
            )
        )
        
        APIClient.shared.perform(request) { (result) in
            completion(result.get)
        }
    }

    
    
}
