//
//  ImageSearchResponse.swift
//  Pixabay Search
//
//  Created by Siju on 18/12/20.
//

import Foundation

struct ImageSearchResponse: Decodable {
    let total, totalHits: Int
    let hits: [Hit]
    
    func merge(with response: ImageSearchResponse) -> ImageSearchResponse{
        ImageSearchResponse(
            total: total + response.total,
            totalHits: totalHits + response.totalHits,
            hits: hits + response.hits
        )
    }
}

struct Hit: Decodable {
    let id: Int
    let pageURL: String
    let type: String?
    let tags: String?
    let previewURL: String
    let previewWidth: Int
    let previewHeight: Int
    let webformatURL: String
    let webformatWidth: Int
    let webformatHeight: Int
    let largeImageURL: String
    let imageWidth: Int
    let imageHeight: Int
    let imageSize: Int
    let views: Int
    let downloads: Int
    let favorites: Int
    let likes: Int
    let comments: Int
    let userID: Int?
    let user: String?
    let userImageURL: String?
}

